import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Apiconnect/ApiConnect.dart';
import '../Models/GetCartInfoResponseModel.dart';
import '../Models/PlaceOrdeItemResponse.dart';
import '../Pojo/GetCartProductResponse.dart';
import '../Provider/ProductProvider.dart';
import '../utility/AppPreference.dart';

class CheckOutScreenController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  late RxList<CartData> CartProdct = RxList();
  late RxList<CartData> CartProdctList = RxList();
  late RxList<PlaceOrderItemsResponse> placeOrderItems = RxList();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController LatitudeController = TextEditingController();
  TextEditingController PostalCodeController = TextEditingController();
  RxString address = RxString("India");
  // DeleteCartResponse deletecartResponse = DeleteCartResponse();
  TextEditingController pickUptimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController additionalInputController = TextEditingController();
  RxString productCategoryDropdown = RxString('Enter Product Category'.tr);
  final selectedCategory = ''.obs;
  final ApiConnect _connect = Get.put(ApiConnect());
  bool isSelectCall = false;
  bool isCall = false;
  var isAdditionalInputEnabled = false.obs;
  Data getCartInfos = Data();
  RxInt count = RxInt(0); // Observable integer
  late ProductProvider userDataProvider;
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
  final List<String> categories = [
    'Cash On Delivery',
    'Net Banking',
    'Upi Payment',
  ];

// RxList <RxString> UpdatePrice =  RxList<RxString> ([RxString("")]);
  paymentProcess() async {
    for (int i = 0; i < onClickList.length; i++) {
      if (onClickList[i] == true) {
        isClicked.value = true;
        selectedIndex = i;
        break;
      }
    }

    if (isClicked.value == false) {
      Fluttertoast.showToast(
        msg: "Select the Time Slot",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
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

  @override
  void onInit() async {
    super.onInit();
    userDataProvider = Provider.of<ProductProvider>(Get.context!, listen: false);

    addressController.text = userDataProvider.getLocation.toString();
    GetCartInfo();
/* GetCartApi();*/
  }

  void increment() {
    count++;
  }

  Future<void> GetCartInfo() async {
    Map<String, dynamic> payload = {
      "customerId": AppPreference().UserId,
    };
    print("GetCartInfopayload: ${payload}");

    isLoading.value = true; // Show the loading spinner at the start

    try {
      var response = await _connect.getCartInfo(payload);
      getCartInfos = response.data!;
      print("Response: ${response.toJson()}");
      if (!response.error!) {
        Fluttertoast.showToast(
          msg: response.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      } else {}
    } catch (e) {
      print("Error occurred: $e");
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  GetCartPlaceItemsApi(context) async {
    if (productCategoryController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Select a Payment Method",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    if (mobileNumberController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter Mobile Number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    if (productCategoryController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Select a Payment Method",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    Map<String, dynamic> payload = {
      "customerId": AppPreference().UserId.toString(),
      "paymentGateway": productCategoryController.text,
      "deliveryOption": userDataProvider.getItNow == "1" ? "pickUp" : "doorstep",
      "orderType": pickupMethods.value,
      "pickupTime": "01:01:01" /*AppPreference().pickup == "PickUp" ? pickUptimeController.text : "0"*/,
      "contactNumber": mobileNumberController.text,
      "deliveryAddress": addressController.text,
    };
    print("PlaceOrderpayload${payload}");
    isLoading.value = true;
    var response = await _connect.PlaceOrderList(payload);
    isLoading.value = false;

    print("Response${response.toJson()}");
    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      pickUptimeController.text = "";
      UpdateTotalPrice.value.isEmpty;
      pickupMethods.value.isEmpty;
      mobileNumberController.text = "";
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => navigateBar()),
      // );
    }
  }

  /*GetCartPlaceItemsApi(context) async {
    List<Map<String, dynamic>> ballonMakingJsonList = placeOrderItems.map((item) => item.toJson()).toList();
    String BallonMarking = jsonEncode(ballonMakingJsonList);

    placeOrderItems.clear();
    for (int i = 0; i < CartProdct.length; i++) {
      PlaceOrderItemsResponse placeItems = PlaceOrderItemsResponse();
      placeItems.productName = CartProdct[index].productName.toString();
      placeItems.productId = CartProdct[index].productId.toString();
      placeItems.productPrice = CartProdct[index].productPrice.toString();
      placeItems.productQty = CartProdct[index].productQty.toString();
      placeItems.orderedQty = counter[index].toString();
      placeOrderItems.add(placeItems);

      String productPrice = CartProdct[i].productPrice.toString();
      String updatePrice = UpdateTotalPrice.value;
      int num1 = int.parse(productPrice);
      int num2 = int.parse(updatePrice);
      int result = num1 + num2;
      UpdateTotalPrice.value = result.toString();
      print(" Total price : ${UpdateTotalPrice.value}");
    }
    print("placeOrderItems ${json.encode(placeOrderItems)}");

    Map<String, dynamic> payload = {
      "items": json.encode(placeOrderItems),
      "sellerId": CartProdct[0].sellerId,
      "customerId": AppPreference().UserId.toString(),
      "firstPromoOffer": "",
      "totalOrderCost": UpdateTotalPrice.value,
      "paymentOption": productCategoryController.text,
      "pickupTime": AppPreference().pickup == "PickUp" ? pickUptimeController.text : "0",
      "deliveryFee": "30",
      "deliveryOption": pickupMethods.value,
      "deliveryTime": "",
      "deliveryMobileNo": mobileNumberController.text
    };
    print("PlaceOrderpayload${payload}");
    isLoading.value = true;
    var response = await _connect.PlaceOrderList(payload);
    isLoading.value = false;

    print("Response${response.toJson()}");
    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      pickUptimeController.text = "";
      UpdateTotalPrice.value.isEmpty;
      pickupMethods.value.isEmpty;
      mobileNumberController.text = "";
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => navigateBar()),
      // );
    }
  }*/

/*  GetCartApi() async {
    Map<String, dynamic> payload = {
      'userId': AppPreference().UserId,
      'productId': "",
    };
    print(payload);
    isLoading.value = true;
    var response = await _connect.GetCart(payload);

    print("CartScreen${response.toJson()}");
    onClickList.clear();
    counter.clear();
    if (!response.error!) {
      print('check cart api');
      CartProdct.value = response.data!;
      debugPrint("getAttendanceList: ${response.toJson()}");
      for (int i = 0; i < response.data!.length; i++) {
        counter.add(RxInt(1));
        update();
      }
    } else {}
    isLoading.value = false;
  }



  DeleteCartApi() async {
    Map<String, dynamic> payload = {
      'userId': AppPreference().UserId,
      'productId': CartProdct.value[index].productId, // Assuming id is the correct field
    };
    print("Deleting product: $payload");
    var response = await _connect.DeleteCart(payload);
    print("Delete API Called: ${response.toJson()}");
    if (response.error != true) {
      Fluttertoast.showToast(
        msg: response.message ?? "Product deleted successfully.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print('Product deleted successfully. Checking cart again.');
      // Refresh the cart items after deletion
      GetCartApi(); // Call to refresh the cart
    } else {
      // Show error message if the deletion fails
      AppSnackBar.error(message: response.message ?? "Error deleting product.");
    }
  }*/

  /*void incrementCounter(int index) {
    isLoading.value = true;
    if (index >= 0 && index < counter.length) {
      counter[index].value++;
    }
    int price = int.tryParse(CartProdct[index].actualPrice ?? '0') ?? 0;
    print("gkg${CartProdct[index].actualPrice}");
    int result = price * counter[index].value;
    UpdatePrice.value = result.toString();
    CartProdct[index].productPrice = UpdatePrice.value;

    log(json.encode(CartProdct));

    isLoading.value = false;
  }

  void updatePrice(int index) {
    if (index >= 0 && index < CartProdct.length && index < counter.length) {}
  }

  void decrementCounter(int index) {
    isLoading.value = true;

    if (index >= 0 && index < counter.length && counter[index].value > 1) {
      counter[index].value--;
    }
    int price = int.tryParse(CartProdct[index].actualPrice ?? '0') ?? 0;
    int result = price * counter[index].value;
    UpdatePrice.value = result.toString();
    CartProdct[index].productPrice = UpdatePrice.value;

    log(json.encode(CartProdct));

    isLoading.value = false;
  }
*/
}