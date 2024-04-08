// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ColorConfig {
  ColorConfig._();
  static final ColorConfig INSTANCE = ColorConfig._();

  static const Color starColor = Color.fromARGB(255, 255, 55, 0);

  static const Color primaryColor = Colors.teal;
  // static const Color primaryColor = Color.fromARGB(255, 18, 130, 8);
  static const Color primaryColorSecondV = Color.fromARGB(255, 187, 73, 248);
  static const Color primaryColorThirdV = Color.fromARGB(255, 73, 17, 103);

  static const Color secondaryColor = Color.fromARGB(255, 228, 221, 19);

  static const Color thirdColor = Color.fromARGB(255, 238, 8, 8);

  static const Color docsColor = Color.fromARGB(255, 111, 230, 232);

  static Color getLinkTextColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.yellow;
    } else {
      return Color.fromARGB(208, 70, 39, 195);
    }
  }

  static Color getInputColor(BuildContext context) {
    
    if (getThemeManager(context).isDarkMode) {
     
      return Color.fromARGB(255, 56, 55, 55);
    } else {
     
      return Color.fromARGB(255, 245, 245, 245);
    }
  }

  static Color getTextColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  static Color getTextColorInverse(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static Gradient boxGradient(BuildContext context) {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        primaryColor,
        secondaryColor,
        thirdColor,
      ],
    );
  }
}
