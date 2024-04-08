import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase/android_auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'services/google_ad_services.dart';
import 'services/preferences_services.dart';
import 'ui/splash_screen_ui.dart';
import 'utilities/configs/controller_provider.dart';
import 'utilities/variables/app_texts.dart';
import 'utilities/variables/fonts_names.dart';

import 'package:stacked_themes/stacked_themes.dart';
import 'utilities/configs/theme_config.dart';
import 'utilities/variables/enums.dart';
import 'utilities/variables/preferences_attributs.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await AuthProvider().initialize();
  await GoogleAdServices.INSTANCE.initialize();
  runApp(const MyApp());
  ControllersProvider.initConnexion();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    Get.updateLocale(locale);
    setState(() {
      _locale = locale;
    });
    PreferencesServices.INSTANCE.updateValues(PreferencesAttributs.appLanguage, locale.languageCode);
  }

  @override
  void initState() {
    _locale = Locale(PreferencesServices.INSTANCE.appLanguage);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeConfig.getActualThemeMode() == AppThemeMode.Dark
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        fontFamily: FontsNames.fontMono,
        primaryColor: Colors.grey[900],
        cardColor: const Color.fromARGB(255, 56, 55, 55),
        canvasColor: const Color.fromARGB(255, 56, 55, 55),
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        fontFamily: FontsNames.fontMono,
        primaryColor: Colors.white,
        cardColor: const Color.fromARGB(255, 245, 245, 245),
        canvasColor: const Color.fromARGB(255, 245, 245, 245),
      ),
      builder: (BuildContext context, ThemeData? regularTheme,
          ThemeData? darkTheme, ThemeMode? themeMode) {
        return GetMaterialApp(
          defaultGlobalState: true,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          title: AppTexts.appName,
          darkTheme: darkTheme,
          themeMode: themeMode ?? ThemeMode.system,
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          home: const SplashScreenUI(),
        );
      },
    );
  }
}