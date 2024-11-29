import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/LoginScreenController.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}
