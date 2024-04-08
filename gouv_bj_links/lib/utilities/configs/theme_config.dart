import 'package:get_storage/get_storage.dart';
import '../variables/variables.dart';

import '../variables/enums.dart';

class ThemeConfig {
  static var themeData = GetStorage(Variables.THEME);

  //
  static AppThemeMode getActualThemeMode() {
    themeData.writeIfNull(Variables.THEME_MODE, Variables.LIGHT);
    if (themeData.read(Variables.THEME_MODE) == Variables.LIGHT) {
      return AppThemeMode.Light;
    } else {
      return AppThemeMode.Dark;
    }
  }
}
