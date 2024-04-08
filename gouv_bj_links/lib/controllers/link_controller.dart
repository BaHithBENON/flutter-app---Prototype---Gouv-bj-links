
import 'package:get/get.dart';

import '../firebase/modules/module_link.dart';
import '../models/model_app_link.dart';

class LinkController extends GetxController {

  // 
  Stream<List<ModelAppLink>> getLinks({String? url, String? details, String? name}) {
    return ModuleLink.INSTANCE.getLinks(url: url, details: details, name: name);
  }

  // 
  Stream<List<ModelAppLink>> getAppLinks() {
    return ModuleLink.INSTANCE.getAppLinks();
  }

  // 
  Stream<List<ModelAppLink>> getSupportTeamLinks() {
    return ModuleLink.INSTANCE.getSupportTeamLinks();
  }

}