import 'package:flutter/material.dart';

abstract class RouteConfig {
  static void to(
      {required Widget page,
      required BuildContext context,
      dynamic arguments,
      bool withReplacement = false}) {
    if (withReplacement) {
      // Navigator.pushReplacement(
      //     context, PageRouteBuilder(pageBuilder: (context, _, __) => page));
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (context, _, __) => page),
          (route) => false);
    } else {
      Navigator.push(
          context, PageRouteBuilder(pageBuilder: (context, _, __) => page));
    }
  }
}
