// ignore_for_file: non_constant_identifier_names

import 'package:package_info_plus/package_info_plus.dart';

class AppInfosServices {
  
  AppInfosServices._();
  static final AppInfosServices INSTANCE = AppInfosServices._();

  Future<PackageInfo> get packageInfos async => await PackageInfo.fromPlatform();
  //PackageInfo packageInfo =>
  // String appName = packageInformations().appName;
  // String packageName = packageInfo.packageName;
  // String version = packageInfo.version;
  // String buildNumber = packageInfo.buildNumber;
}