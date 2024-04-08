import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/model_app_file.dart';
import '../models/model_app_link.dart';
import '../models/model_app_update.dart';
import '../models/model_click.dart';
import '../models/model_text_in_language.dart';
import '../utilities/configs/language_model.dart';
import 'document_to_model.dart';

class DocumentsToModelsList {

  static List<ModelAppFile> appFilesListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.appFileFromSnapshot(doc);
    }).toList();
  }

  static List<ModelAppLink> linksListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.linkFromSnapshot(doc);
    }).toList();
  }

  static List<ModelClick> clicksListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.clickFromSnapshot(doc);
    }).toList();
  }

  static List<ModelAppUpdate> appUpdatesListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.appUpdateFromSnapshot(doc);
    }).toList();
  }

  static List<LanguageModel> languagesListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.languageFromSnapshot(doc);
    }).toList();
  }

  static List<ModelTextInLanguage> textInLangListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return DocumentToModel.textInLangFromSnapshot(doc);
    }).toList();
  }
}
