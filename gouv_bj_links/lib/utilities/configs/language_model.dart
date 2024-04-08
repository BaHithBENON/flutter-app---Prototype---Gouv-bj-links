import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../variables/models_attributs.dart';

class LanguageModel {
  String? modelId;
  final int id;
  final String name;
  final String languageCode;

  LanguageModel({
    this.modelId,
    required this.id,
    required this.name,
    required this.languageCode,
  });

  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelsAttributs.ID: id,
      ModelsAttributs.MODEL_ID: modelId,
      ModelsAttributs.NAME: name,
      ModelsAttributs.LANGUAGE_CODE: languageCode,
    };
  }

  factory LanguageModel.toLanguageModel(dynamic data) {
    return LanguageModel(
      id: data[ModelsAttributs.ID],
      modelId: data[ModelsAttributs.MODEL_ID],
      name: data[ModelsAttributs.NAME],
      languageCode: data[ModelsAttributs.LANGUAGE_CODE],
    );
  }

  static List<LanguageModel> languageList () {
    return <LanguageModel>[
      LanguageModel(id: 1, name: "Français", languageCode: "fr"),
      LanguageModel(id: 2, name: "English", languageCode: "en"),
      LanguageModel(id: 3, name: "Espanol", languageCode: "es"),
      LanguageModel(id: 4, name: "Japanese", languageCode: "ja"),
      LanguageModel(id: 5, name: "Arabic", languageCode: "ar"),
      LanguageModel(id: 6, name: "Russian", languageCode: "ru"),
      LanguageModel(id: 7, name: "Turkish", languageCode: "tr"),
    ];
  }
}

class LanguageConfig {
  static AppLocalizations translate(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}