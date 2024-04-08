// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../utilities/variables/images_sources.dart';

class AppLogoWidget extends StatelessWidget {
  double? size;
  bool withWidth;
  AppLogoWidget({super.key, this.size = 80, this.withWidth = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: withWidth ? size : null,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.asset(
        getThemeManager(context).isDarkMode ? ImagesSources.gbjlink_bg_dark : ImagesSources.gbjlink_bg_light_2,
        fit: BoxFit.cover,
      ),
    );
  }
}