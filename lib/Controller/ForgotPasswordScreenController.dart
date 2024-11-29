import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Apiconnect/ApiConnect.dart';
import '../Pageroutes/App_routes.dart';

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = RxBool(false);
  TextEditingController olsPassController = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool initialLoading = RxBool(false);
  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool isVisible = false.obs;
  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  ForgotPasswordApi() async {
    Map<String, dynamic> payload = {'customerMobile': usercontroller.text, "customerPassword": confirmPassController.text};
    print("FogotPassword_payload ${payload}");
    isLoading.value = true;
    var response = await _connect.forgotPassword(payload);
    isLoading.value = false;
    print('FogotPassword_Response${response.toJson()}');

    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      Get.toNamed(AppRoutes.root.toName);

      //update();
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
