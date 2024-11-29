import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/ScreenOneController.dart';

class ScreenOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenOneController>(() => ScreenOneController());
  }
}
