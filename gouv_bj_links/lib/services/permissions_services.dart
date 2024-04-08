// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  PermissionsService._();
  static final PermissionsService INSTANCE = PermissionsService._();

  Future<void> requestPermision({required Permission permission}) async {
    try {
      var status = await permission.request();
      if (status.isGranted) {
        // debugPrint("done.....");
      } else if (status.isDenied) {
        requestPermision(permission: permission);
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
