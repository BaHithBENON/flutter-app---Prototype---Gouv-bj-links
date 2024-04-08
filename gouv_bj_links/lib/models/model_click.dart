import '../utilities/variables/models_attributs.dart';

class ModelClick {
  String? modelId;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? linkId;
  int? clickCounter;

  ModelClick({
    this.modelId,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.linkId,
    this.clickCounter,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelsAttributs.CREATED_TIMESTAMP: createdTimestamp,
      ModelsAttributs.MODEL_ID: modelId,
      ModelsAttributs.LINK_ID: linkId,
      ModelsAttributs.CLICK_COUNTER: clickCounter,
      ModelsAttributs.UPDATED_TIMESTAMP: updatedTimestamp,
    };
  }

  factory ModelClick.toModelClick(dynamic data) {
    return ModelClick(
      createdTimestamp: data[ModelsAttributs.CREATED_TIMESTAMP],
      modelId: data[ModelsAttributs.MODEL_ID],
      linkId: data[ModelsAttributs.LINK_ID],
      clickCounter: data[ModelsAttributs.CLICK_COUNTER],
      updatedTimestamp: data[ModelsAttributs.UPDATED_TIMESTAMP],
    );
  }
}