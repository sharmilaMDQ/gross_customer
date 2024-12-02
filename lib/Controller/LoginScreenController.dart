import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grosshop/Components/AppTheme.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';

import '../Apiconnect/ApiConnect.dart';
import '../Pageroutes/App_routes.dart';
import '../Provider/ProductProvider.dart';
import '../utility/AppPreference.dart';
import 'AddNewAddressController.dart';

class LoginScreenController extends GetxController {
  late ProductProvider userDataProvider;
  final ApiConnect _connect = Get.put(ApiConnect());

  final AddNewAddressController addressController = Get.put(AddNewAddressController());

  RxBool isLoading = RxBool(false);
  RxBool isPhoneNoError = RxBool(false);
  RxBool isPasswordError = RxBool(false);
  RxBool isVisible = false.obs;

  RxString mobileNumber = RxString('');
  RxString password = RxString('');

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  // void openFacebookUrl() async {
  //   const facebookUrl = 'https://www.facebook.com/valiancetechnology';
  //
  //   if (await canLaunch(facebookUrl)) {
  //     await launch(facebookUrl);
  //   } else {
  //     // Handle the case if the URL can't be launched
  //     print('Could not launch Facebook URL');
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();
    userDataProvider = Provider.of<ProductProvider>(Get.context!, listen: false);

    mobileNumberController.addListener(() {
      mobileNumber.value = mobileNumberController.text;
    });

    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    addressController.getCustomerAddress();
  }

  // void loginApi(BuildContext context) {
  //   isLoading.value = true;
  // }

  Future<void> loginApi(context) async {
    isPhoneNoError.value = false;
    isPasswordError.value = false;
    if (mobileNumberController.value.text.isEmpty) {
      isPhoneNoError.value = true;
      Fluttertoast.showToast(
        msg: "Please Enter Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (mobileNumberController.value.text.length != 10) {
      isPhoneNoError.value = true;
      Fluttertoast.showToast(
        msg: "Please Enter Valid Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (passwordController.value.text.isEmpty) {
      isPasswordError.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Password!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    Map<String, dynamic> payload = {
      'customerMobile': /*"8608191855"*/ mobileNumberController.value.text.toString(),
      'customerPassword': /*"12345678"*/ passwordController.value.text.toString(),
    };
    print("LoginPayload${payload}");
    isLoading.value = true;
    var response = await _connect.LoginScreenres(payload);
    isLoading.value = false;

    print('loginResponse ${response.toJson()}');
    if (!response.error!) {
  MotionToast.success(
        title: const Text("Success",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        description: Text(response.message ?? "",
            style: TextStyle(color: Colors.white, fontSize: 12)),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        borderRadius: 10,
        displaySideBar: false,
        enableAnimation: false,
      ).show(context);
      AppPreference().updateUserId(response.data!.customerId!.toString());
      AppPreference().updateMobileNumber(response.data!.customerMobile!.toString());
      AppPreference().updateCustomerName(response.data!.firstName!.toString());

      Get.toNamed(AppRoutes.login.toName);
      update();
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) =>  ProductHomeScreen()),
      //   (route) => false,
      // );
      mobileNumberController.text = "";
      passwordController.text = "";
    } else {
        MotionToast.success(
        title: const Text("Failed",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        description: Text(response.message ?? "",
            style: TextStyle(color: Colors.white, fontSize: 12)),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        borderRadius: 10,
        displaySideBar: false,
        enableAnimation: false,
      ).show(context);
    }
  }
}
