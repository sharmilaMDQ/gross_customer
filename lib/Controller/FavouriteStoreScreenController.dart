import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../Apiconnect/ApiConnect.dart';
import '../Forms/AppSnackBar.dart';
import '../Pageroutes/App_routes.dart';
import '../Provider/ProductProvider.dart';
import '../utility/BottomNavigationBar.dart';

class FavouriteStoreScreenController extends GetxController {
  final ApiConnect _connect = Get.put(ApiConnect());

  RxBool Location = RxBool(false);
  RxBool isLoading = RxBool(false);
  RxBool State = RxBool(false);
  RxBool PostalCode = RxBool(false);
  RxBool SelectStore = RxBool(false);
  late ProductProvider userDataProvider;
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController LatitudeController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController PostalCodeController = TextEditingController();
  TextEditingController SelectStoreController = TextEditingController();
  var initialPosition = const LatLng(-25.363, 131.044).obs;
  var infoWindowText = 'Click the map to get Lat/Lng!'.obs;
  RxString address = RxString("India");
  late GoogleMapController googleMapController;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void onMapClicked(LatLng latLng) {
    infoWindowText.value = 'Lat: ${latLng.latitude}, Lng: ${latLng.longitude}';
    initialPosition.value = latLng;
  }

  @override
  void onInit() async {
    super.onInit();
    userDataProvider = Provider.of<ProductProvider>(Get.context!, listen: false);
    determinePosition2();
  }

  Future<Position> determinePosition2() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
  
    return await Geolocator.getCurrentPosition();
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

  validation(context) {
    if (PostalCodeController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Select the Your Location",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const navigateBar(
                initialIndex: 0,
              )),
    );
  }

  FavoriteScreenApi() async {
    Map<String, dynamic> payload = {
      'latitude': userDataProvider.getLatitude.toString(),
      'Longitude': userDataProvider.getLongitude.toString(),
    };
    print(payload);

    var response = await _connect.favoriteScreen(payload);
    if (!response.error!) {
      Get.toNamed(AppRoutes.home.toName);

      update();
    } else {
      AppSnackBar.error(message: response.message!);
    }
  }
}
