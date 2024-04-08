// ignore_for_file: non_constant_identifier_names

import '../../models/model_app_update.dart';
import '../document_to_model.dart';
import '../firebase_datas.dart';

class ModuleGeneral {
  //
  ModuleGeneral._();
  static final ModuleGeneral INSTANCE = ModuleGeneral._();

  // 
  Stream<ModelAppUpdate> getAppUpdates() {
    return FireDatas.appUpdates
      .snapshots()
      .map((event) => DocumentToModel.appUpdateFromSnapshot(event.docs[0]))
      .asBroadcastStream();
  }

  Future<ModelAppUpdate> getAppVersions() {
    return FireDatas.appUpdates
      .get()
      .then((event) => DocumentToModel.appUpdateFromSnapshot(event.docs[0]));
  }
  
}