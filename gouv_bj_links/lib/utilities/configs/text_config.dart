import 'package:flutter/material.dart';

import '../variables/fonts_names.dart';

class TextConfig {
  static TextStyle getSimpleTextStyle(
    bool bold, {
    Color? color,
    int? size,
    String font = FontsNames.fontMono,
    bool underline = false,
    Color? underlineColor,
  }) {
    return TextStyle(
        fontFamily: font,
        decoration: underline ? TextDecoration.underline : null,
        decorationThickness: underline ? 5 : 0,
        decorationColor: underlineColor,
        decorationStyle: underline ? TextDecorationStyle.double : null,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: size != null ? (size == 3 ? 10 : size.toDouble()) : null,
        color: color);
  }
}
