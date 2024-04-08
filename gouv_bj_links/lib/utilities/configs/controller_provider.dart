// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../../controllers/click_controller.dart';
import '../../controllers/link_controller.dart';
import '../../controllers/network_controller.dart';
import '../../controllers/setting_controller.dart';
import '../../controllers/splash_controller.dart';

class ControllersProvider {

  static void initConnexion() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<SplashController>(SplashController());
    Get.put<SettingController>(SettingController());
  }

  static void put() {
    Get.put<SettingController>(SettingController());
    Get.put<SplashController>(SplashController());
    Get.put<NetworkController>(NetworkController());
    Get.put<LinkController>(LinkController());
    Get.put<ClickController>(ClickController());
  }

  static final NETWORK_CONTROLLER = Get.find<NetworkController>();
  static final LINK_CONTROLLER = Get.find<LinkController>();
  static final CLICK_CONTROLLER = Get.find<ClickController>();
  static final SETTING_CONTROLLER = Get.find<SettingController>();
  static final SPLASH_CONTROLLER = Get.find<SplashController>();
}
