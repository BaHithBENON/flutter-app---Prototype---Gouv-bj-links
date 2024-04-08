// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../ui/home_page_ui.dart';
import '../ui/starter_ui.dart';
import '../utilities/configs/controller_provider.dart';

import '../firebase/firebase_datas.dart';
import 'preferences_services.dart';

class AuthVerifyService {
  AuthVerifyService._();
  static final AuthVerifyService INSTANCE = AuthVerifyService._();

  // Si quelqu'un est connecté
  bool get isLogged => FireDatas.AUTH.currentUser != null;

  // Si c'est la première fois sur l'application
  bool get isAlreadyOpenedApp =>
      PreferencesServices.INSTANCE.isAlreadyOpenedApp;

  Widget get startPage {
    ControllersProvider.put();
    if (isAlreadyOpenedApp) {
      return const HomePageUI();
    } else {
      return const StarterUI();
    }
  }
}
