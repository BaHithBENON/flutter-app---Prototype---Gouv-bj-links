// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../utilities/configs/language_model.dart';
import '../utilities/variables/variables.dart';

import '../utilities/variables/enums.dart';

class ThemeModeService {
  ThemeModeService._();
  static final ThemeModeService INSTANCE = ThemeModeService._();
  // Theme mode changement
  var themeData = GetStorage(Variables.THEME);
  //
  void changeTheme(dynamic context, {AppThemeMode? mode}) {
    if (mode != null) {
      getThemeManager(context).setThemeMode(
          mode == AppThemeMode.Dark ? ThemeMode.dark : ThemeMode.light);
    } else {
      getThemeManager(context).toggleDarkLightTheme();
      if (getThemeManager(context).isDarkMode) {
        themeData.write(Variables.THEME_MODE, Variables.DARK);
      } else {
        themeData.write(Variables.THEME_MODE, Variables.LIGHT);
      }
    }
  }

  String getActualTheme(BuildContext context) => getThemeManager(context).isDarkMode ? LanguageConfig.translate(context).dark : LanguageConfig.translate(context).light;
}
