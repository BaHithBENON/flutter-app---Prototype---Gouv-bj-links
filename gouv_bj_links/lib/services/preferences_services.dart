// ignore_for_file: non_constant_identifier_names

import 'package:get_storage/get_storage.dart';

import '../utilities/configs/language_model.dart';
import '../utilities/variables/preferences_attributs.dart';
import '../utilities/variables/variables.dart';

class PreferencesServices {
  PreferencesServices._();
  static final PreferencesServices INSTANCE = PreferencesServices._();

  final storage = GetStorage();

  void updateValues(String key, dynamic value) {
    storage.write(key, value);
  }

  bool get isAlreadyOpenedApp {
    if (storage.read(PreferencesAttributs.isAlreadyOpenedApp) == null) {
      storage.write(PreferencesAttributs.isAlreadyOpenedApp, false);
      return false;
    }
    return true;
  }

  int get appWrapperLastPageIndex {
    if (storage.read(PreferencesAttributs.appWrapperLastPageIndex) == null) {
      storage.write(PreferencesAttributs.appWrapperLastPageIndex, 0);
    }
    return storage.read(PreferencesAttributs.appWrapperLastPageIndex) as int;
  }

  String get marketplaceCountry {
    if (storage.read(PreferencesAttributs.marketplaceCountry) == null) {
      storage.write(PreferencesAttributs.marketplaceCountry, "");
    }
    return storage.read(PreferencesAttributs.marketplaceCountry) as String;
  }


  String get appLanguage {
    if (storage.read(PreferencesAttributs.appLanguage) == null) {
      storage.write(PreferencesAttributs.appLanguage, LanguageModel.languageList()[0].languageCode);
    }
    return storage.read(PreferencesAttributs.appLanguage) as String;
  }

  String get appThemeMode {
    if (storage.read(Variables.THEME_MODE) == null) {
      storage.write(Variables.THEME_MODE, Variables.LIGHT);
    }
    return storage.read(Variables.THEME_MODE) as String;
  }

}
