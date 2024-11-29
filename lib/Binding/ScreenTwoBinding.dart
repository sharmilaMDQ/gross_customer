import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/ScreenTwoController.dart';

class ScreenTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenTwoController>(() => ScreenTwoController());
  }
}
