
// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import 'preferences_services.dart';

class LanguageServices extends GetxController{
  LanguageServices._();
  static final LanguageServices INSTANCE = LanguageServices._();

  String getActualLanguageCode() {
    return PreferencesServices.INSTANCE.appLanguage;
  }
}