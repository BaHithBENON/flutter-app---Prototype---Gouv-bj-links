import '../utilities/variables/models_attributs.dart';
import 'model_app_file.dart';
import 'model_text_in_language.dart';

class ModelAppLink {
  String? modelId;
  String? createdTimestamp;
  String? linkName;
  String? linkUrl;
  List<ModelAppFile>? linkImages;
  List<ModelTextInLanguage>? details;
  List<ModelTextInLanguage>? titles;
  String? linkDetails;

  ModelAppLink({
    this.modelId,
    this.createdTimestamp,
    this.linkImages,
    this.linkName,
    this.linkUrl,
    this.linkDetails,
    this.details,
    this.titles,
  });

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> listImages_ = [];
    List<Map<String, dynamic>> listDetails_ = [];
    List<Map<String, dynamic>> listTitles_ = [];
    if (linkImages != null) {
      for (var element in linkImages!) {
        listImages_.add(element.toMap());
      }
    }

    if (details != null) {
      for (var element in details!) {
        listDetails_.add(element.toMap());
      }
    }

    if (titles != null) {
      for (var element in titles!) {
        listTitles_.add(element.toMap());
      }
    }

    return <String, dynamic>{
      ModelsAttributs.CREATED_TIMESTAMP: createdTimestamp,
      ModelsAttributs.MODEL_ID: modelId,
      ModelsAttributs.LINK_NAME: linkName,
      ModelsAttributs.LINK_URL: linkUrl,
      ModelsAttributs.LINK_IMAGES: listImages_,
      ModelsAttributs.LINK_DETAILS: linkDetails,
      ModelsAttributs.DETAILS: listDetails_,
      ModelsAttributs.TITLES: listTitles_,
    };
  }

  factory ModelAppLink.toModelAppLink(dynamic data) {
    List<ModelAppFile> listImages_ = [];
    List<ModelTextInLanguage> listDetails_ = [];
    List<ModelTextInLanguage> listTitles_ = [];

    if (data[ModelsAttributs.LINK_IMAGES] != null) {
      for (var element in data[ModelsAttributs.LINK_IMAGES]) {
        listImages_.add(ModelAppFile.toModelAppFile(element));
      }
    }

    if (data[ModelsAttributs.DETAILS] != null) {
      for (var element in data[ModelsAttributs.DETAILS]) {
        listDetails_.add(ModelTextInLanguage.toModelTextInLanguage(element));
      }
    }

    if (data[ModelsAttributs.TITLES] != null) {
      for (var element in data[ModelsAttributs.TITLES]) {
        listTitles_.add(ModelTextInLanguage.toModelTextInLanguage(element));
      }
    }


    return ModelAppLink(
      createdTimestamp: data[ModelsAttributs.CREATED_TIMESTAMP],
      modelId: data[ModelsAttributs.MODEL_ID],
      linkName: data[ModelsAttributs.LINK_NAME],
      linkUrl: data[ModelsAttributs.LINK_URL],
      linkImages: listImages_,
      linkDetails: data[ModelsAttributs.LINK_DETAILS],
      details: listDetails_,
      titles: listTitles_,
    );
  }
}