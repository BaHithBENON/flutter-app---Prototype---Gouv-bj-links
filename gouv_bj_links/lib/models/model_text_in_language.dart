import '../utilities/variables/models_attributs.dart';

class ModelTextInLanguage {
  String? context;
  String? languageCode;

  ModelTextInLanguage({this.context, this.languageCode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelsAttributs.CONTEXT: context,
      ModelsAttributs.LANGUAGE_CODE: languageCode,
    };
  }

  factory ModelTextInLanguage.toModelTextInLanguage(dynamic data) {
    return ModelTextInLanguage(
      context: data[ModelsAttributs.CONTEXT],
      languageCode: data[ModelsAttributs.LANGUAGE_CODE],
    );
  }
}