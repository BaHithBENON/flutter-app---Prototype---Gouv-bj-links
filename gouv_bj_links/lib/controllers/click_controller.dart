import 'package:get/get.dart';

import '../firebase/modules/module_click.dart';
import '../models/model_click.dart';
import '../utilities/variables/enums.dart';

class ClickController extends GetxController {
   // 
  Stream<List<ModelClick>> getClicksOnLinks({required String linkId}) {
    return ModuleClick.INSTANCE.getClicksOnLinks(linkId: linkId);
  }

  Future<ReturnStatus?> updateClickOnLink({required String linkId}) async {
    return ModuleClick.INSTANCE.updateClickOnLink(linkId: linkId);
  }
}