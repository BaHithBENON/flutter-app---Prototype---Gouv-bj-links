import 'package:get/get.dart';

import '../controllers/link_controller.dart';
import '../controllers/setting_controller.dart';

class LinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinkController>(() => LinkController());
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
