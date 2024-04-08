// ignore_for_file: non_constant_identifier_names

import '../../models/model_app_link.dart';
import '../../utilities/variables/models_attributs.dart';
import '../documents_to_models_list.dart';
import '../firebase_datas.dart';

class ModuleLink {
  ModuleLink._();
  static final ModuleLink INSTANCE = ModuleLink._();

  // 
  Stream<List<ModelAppLink>> getLinks({String? url, String? details, String? name}) {
    if(url != null) {
      return FireDatas.links
        .where(ModelsAttributs.LINK_URL, arrayContains: url)
          .snapshots()
          .map(DocumentsToModelsList.linksListFromSnapshot)
        .asBroadcastStream();
    } else if(details != null) {
      return FireDatas.links
        .where(ModelsAttributs.LINK_DETAILS, arrayContains: details)
          .snapshots()
          .map(DocumentsToModelsList.linksListFromSnapshot)
        .asBroadcastStream();
    } else if(name != null) {
      return FireDatas.links
        .where(ModelsAttributs.LINK_NAME, arrayContains: name)
          .snapshots()
          .map(DocumentsToModelsList.linksListFromSnapshot)
        .asBroadcastStream();
    } else  {
      return FireDatas.links
        .snapshots()
        .map(DocumentsToModelsList.linksListFromSnapshot)
        .asBroadcastStream();
    }
  }

  // 
  Stream<List<ModelAppLink>> getAppLinks() {
    return FireDatas.appLinks
      .snapshots()
      .map(DocumentsToModelsList.linksListFromSnapshot)
      .asBroadcastStream();
  }


  // 
  Stream<List<ModelAppLink>> getSupportTeamLinks() {
    return FireDatas.supportTeamLinks
      .snapshots()
      .map(DocumentsToModelsList.linksListFromSnapshot)
      .asBroadcastStream();
  }
}