import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:grosshop/utility/AppPreference.dart';
import 'package:provider/provider.dart';

import '../Apiconnect/ApiConnect.dart';
import '../Models/GetCustomerAddressResponseModel.dart';
import '../Provider/ProductProvider.dart';

class AddNewAddressController extends GetxController {
  var selectedRadioIndex = 0.obs; // Observable for the selected radio button index
  var selectedAddress = GetCustomerAddresses().obs; // Assuming AddressModel is your model class
  RxInt selectedTabIndex = 0.obs;
  late ProductProvider userDataProvider;
  RxString address = RxString("India");
  RxString productCategoryDropdown = RxString('Enter Product Category'.tr);
  final selectedCategory = ''.obs;
  final ApiConnect _connect = Get.put(ApiConnect());
  bool isSelectCall = false;
  bool isCall = false;
  RxInt count = RxInt(0); // Observable integer
  RxList<bool> onClickList = RxList();
  RxBool isClicked = RxBool(false);
  RxList<bool> onClickCounterList = RxList();

  RxBool isLoading = RxBool(false);
  int index = 0;
  RxString pickupMethods = RxString("");
  RxString UpdatePrice = RxString("");
  RxString UpdateTotalPrice = RxString("0");
  RxList<RxInt> counter = RxList<RxInt>([RxInt(1)]);
  int selectedIndex = 0;
  RxInt selectedIndexOne = RxInt(0);

  ///
  RxList<GetCustomerAddresses> getAddressesList = RxList();

  TextEditingController LongitudeController = TextEditingController();
  TextEditingController LatitudeController = TextEditingController();
  TextEditingController PostalCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    userDataProvider = Provider.of<ProductProvider>(Get.context!, listen: false);
    addressController.text = userDataProvider.getLocation.toString();
    getCustomerAddress();
  }

  Future<void> getCustomerAddress() async {
    Map<String, dynamic> payload = {
      'customerId': AppPreference().UserId.toString(),
    };
    print(payload);
    isLoading.value = true;
    var response = await _connect.getCustomerAddress(payload);
    isLoading.value = false;
    print("Delete Api Called ${response.toJson()}");
    if (!response.error!) {
      getAddressesList.value = response.data!;
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } else {}
  }

  Future<void> deleteCustomerAddress(int index) async {
    Map<String, dynamic> payload = {
      'customerAddressId': getAddressesList[index].customerAddressId,
    };
    print(payload);
    isLoading.value = true;

    var response = await _connect.deleteCustomerAddresses(payload);

    isLoading.value = false;

    print("Delete API Called ${response.toJson()}");

    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print('Address deleted successfully');
      getAddressesList.removeAt(index);
      update();
      getCustomerAddress();
    } else {
      Fluttertoast.showToast(
        msg: "Failed to delete address",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;

      // Request high accuracy location
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );

      LatitudeController.text = position.latitude.toString();
      LongitudeController.text = position.longitude.toString();

      // Retrieve address details based on coordinates
      List<Placemark> result = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (result.isNotEmpty) {
        Placemark place = result[0];
        address.value = '${place.name}${place.subThoroughfare} ${place.thoroughfare}, '
            '${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, '
            '${place.administrativeArea}, ${place.postalCode}, ${place.country}';
      }

      // Save data using the userDataProvider
      userDataProvider.setLatitude(position.latitude.toString());
      userDataProvider.setLongitude(position.longitude.toString());
      userDataProvider.SetSelectedLocation(address.value);

      // Update Postal Code field
      PostalCodeController.text = userDataProvider.getLocation.toString();
    } catch (e) {
      print("Failed to get location: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
