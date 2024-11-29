import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../ApiConfig/ApiUrl.dart';
import '../Apiconnect/ApiConnect.dart';
import '../Components/image_pickers.dart';
import '../Models/RegisterIdResponse.dart';
import '../UI/SplashScreens/FavouriteStoreScreen.dart';
import '../utility/AppPreference.dart';

class CreateAccountScreenController extends GetxController {
  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool isVisible = false.obs;
  RxBool name = RxBool(false);
  RxBool mobilenum = RxBool(false);
  RxBool password = RxBool(false);
  RxBool address = RxBool(false);
  RxBool city = RxBool(false);
  RxBool state = RxBool(false);
  RxBool pincode = RxBool(false);
  RxBool country = RxBool(false);
  RxBool cusimage = RxBool(false);
  Rx<PickedImage?> item_image = Rx<PickedImage?>(null);
  RxString imageString = RxString("");
  RxBool isImageSelected = false.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilenumcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  RegisterApi(context) async {
    if (namecontroller.value.text.isEmpty) {
      name.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Name!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (mobilenumcontroller.value.text.isEmpty) {
      mobilenum.value = true;
      Fluttertoast.showToast(
        msg: "Please enter  Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (passwordcontroller.value.text.isEmpty) {
      password.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Password!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (addresscontroller.value.text.isEmpty) {
      address.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Address!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (citycontroller.value.text.isEmpty) {
      city.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your City!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (statecontroller.value.text.isEmpty) {
      state.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your State!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (pincodecontroller.value.text.isEmpty) {
      pincode.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Pincode!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (countrycontroller.value.text.isEmpty) {
      country.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Country!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    // MediaType contentType = MediaType.parse('image/jpeg');
    // MultipartFileExtended imageFile = multipartFileFromPathSync(
    //   item_image.value!.file!.path,
    //   filename: item_image.value!.file!.name,
    //   contentType: contentType,
    // );
    Map<String, String> payload = {
      'customerName': namecontroller.value.text.toString(),
      'customerMobile': mobilenumcontroller.value.text.toString(),
      'customerPassword': passwordcontroller.value.text.toString(),
      'customerAddress': addresscontroller.value.text.toString(),
      'customerCity': citycontroller.value.text.toString(),
      'customerState': statecontroller.value.text.toString(),
      'customerPincode': pincodecontroller.value.text.toString(),
      'customerCountry': countrycontroller.value.text.toString(),
    };
    print(payload);
    RegisterCustomerIdResponse response;
    if (item_image.value == null) {
      response = await _connect.registerUpload(payload, ApiUrl.register);
    } else {
      response = await _connect.imgRegisterCall(ApiUrl.register, item_image.value!.file!, payload);
    }
    debugPrint("loginCallResponse: ${response.toJson()}");

    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      AppPreference().updateUserId(response.customerId!.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavouriteStoreScreen()),
      );
    } else {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
