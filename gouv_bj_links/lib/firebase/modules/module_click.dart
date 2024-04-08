// ignore_for_file: non_constant_identifier_names

import '../../models/model_click.dart';
import '../../utilities/variables/enums.dart';
import '../../utilities/variables/models_attributs.dart';
import '../document_to_model.dart';
import '../documents_to_models_list.dart';
import '../firebase_datas.dart';

class ModuleClick {
  //
  ModuleClick._();
  static final ModuleClick INSTANCE = ModuleClick._();

  //
    //
  Future<ReturnStatus?> updateClickOnLink({required String linkId}) async {
    ReturnStatus status_ = ReturnStatus.Nothing;
    try {
      //
      await FireDatas.FIRESTORE.runTransaction((transaction) async {
        await FireDatas.clicksLinks
            .where(ModelsAttributs.LINK_ID, isEqualTo: linkId)
            .get()
            .then(
          (value) async {
            if (value.docs.isNotEmpty) {
              ModelClick modelClick = DocumentToModel.clickFromSnapshot(value.docs[0]);
              if(modelClick.clickCounter == 0) {
                modelClick.clickCounter = 1;
              } else {
                modelClick.clickCounter = modelClick.clickCounter! + 1;  
              }
              modelClick.updatedTimestamp = DateTime.now().millisecondsSinceEpoch.toString();
              transaction.update(value.docs[0].reference, modelClick.toMap());
            } else {
              var doc =  FireDatas.clicksLinks.doc();
              ModelClick modelClick = ModelClick(
                clickCounter: 1,
                createdTimestamp: DateTime.now().millisecondsSinceEpoch.toString(),
                updatedTimestamp: DateTime.now().millisecondsSinceEpoch.toString(),
                linkId: linkId,
                modelId: doc.id,
              );
              transaction.set(doc, modelClick.toMap());
            }
          },
        );
      }).catchError((e) {
        status_ = ReturnStatus.Failure;
      }).onError((error, stackTrace) {
        status_ = ReturnStatus.Failure;
      }).then((value) {
        status_ = ReturnStatus.Success;
      });
    } catch (e) {
      status_ = ReturnStatus.Failure;
    }
    return status_;
  }

  // 
  Stream<List<ModelClick>> getClicksOnLinks({required String linkId}) {
    return FireDatas.clicksLinks
      .where(ModelsAttributs.LINK_ID, isEqualTo: linkId)
      .snapshots()
      .map(DocumentsToModelsList.clicksListFromSnapshot)
      .asBroadcastStream();
  }
  
}