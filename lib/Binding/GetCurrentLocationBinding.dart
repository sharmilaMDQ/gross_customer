import 'package:get/get.dart';

import '../Controller/ForgotPasswordScreenController.dart';
import '../Controller/MapController.dart';

class GetCurrentLocationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(
            () => MapController());
  }
}
