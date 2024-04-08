import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/model_app_file.dart';
import '../models/model_app_link.dart';
import '../models/model_app_update.dart';
import '../models/model_click.dart';
import '../models/model_text_in_language.dart';
import '../utilities/configs/language_model.dart';
class DocumentToModel {

  static ModelAppFile appFileFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return ModelAppFile.toModelAppFile(data);
  }


  static ModelAppLink linkFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return ModelAppLink.toModelAppLink(data);
  }

  static ModelClick clickFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return ModelClick.toModelClick(data);
  }

  static ModelAppUpdate appUpdateFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return ModelAppUpdate.toModelAppUpdate(data);
  }

  static LanguageModel languageFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return LanguageModel.toLanguageModel(data);
  }

  static ModelTextInLanguage textInLangFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception('Message not found');
    return ModelTextInLanguage.toModelTextInLanguage(data);
  }
}
