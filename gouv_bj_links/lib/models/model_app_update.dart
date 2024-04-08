import '../utilities/variables/models_attributs.dart';

class ModelAppUpdate {
  String? modelId;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? oldAppVersion;
  String? newAppVersion;
  String? buildNumber;
  String? linkUrl;
  String? year;
  String? month;
  String? day;
  bool? isForced;

  ModelAppUpdate({
    this.modelId,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.oldAppVersion,
    this.newAppVersion,
    this.buildNumber,
    this.linkUrl,
    this.year,
    this.day,
    this.month,
    this.isForced,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelsAttributs.CREATED_TIMESTAMP: createdTimestamp,
      ModelsAttributs.MODEL_ID: modelId,
      ModelsAttributs.OLD_APP_VERSION: oldAppVersion,
      ModelsAttributs.NEW_APP_VERSION: newAppVersion,
      ModelsAttributs.UPDATED_TIMESTAMP: updatedTimestamp,
      ModelsAttributs.LINK_URL: linkUrl,
      ModelsAttributs.YEAR: year,
      ModelsAttributs.MONTH: month,
      ModelsAttributs.DAY: day,
      ModelsAttributs.IS_FORCED: isForced,
      ModelsAttributs.BUILD_NUMBER: buildNumber,
    };
  }

  factory ModelAppUpdate.toModelAppUpdate(dynamic data) {
    return ModelAppUpdate(
      createdTimestamp: data[ModelsAttributs.CREATED_TIMESTAMP],
      modelId: data[ModelsAttributs.MODEL_ID],
      oldAppVersion: data[ModelsAttributs.OLD_APP_VERSION],
      newAppVersion: data[ModelsAttributs.NEW_APP_VERSION],
      updatedTimestamp: data[ModelsAttributs.UPDATED_TIMESTAMP],
      linkUrl: data[ModelsAttributs.LINK_URL],
      day: data[ModelsAttributs.DAY],
      month: data[ModelsAttributs.MONTH],
      year: data[ModelsAttributs.YEAR],
      isForced: data[ModelsAttributs.IS_FORCED],
      buildNumber: data[ModelsAttributs.BUILD_NUMBER],
    );
  }
}