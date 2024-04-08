import 'package:get/get.dart';

import '../firebase/modules/module_general.dart';
import '../models/model_app_update.dart';

class SettingController extends GetxController {

  // 
  Stream<ModelAppUpdate> getAppUpdates() {
    return ModuleGeneral.INSTANCE.getAppUpdates();
  }

  Future<ModelAppUpdate> getAppVersions() {
    return ModuleGeneral.INSTANCE.getAppVersions();
  }
}