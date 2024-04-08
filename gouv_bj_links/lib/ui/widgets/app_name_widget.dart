// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../utilities/configs/color_config.dart';
import '../../../utilities/configs/text_config.dart';
import '../../../utilities/variables/app_texts.dart';
import '../../../utilities/variables/fonts_names.dart';

class AppNameWidget extends StatefulWidget {
  int maxSize;
  int minSize;
  AppNameWidget({Key? key, this.maxSize = 50, this.minSize = 30})
      : super(key: key);
  @override
  State<AppNameWidget> createState() => _AppNameWidgetState();
}

class _AppNameWidgetState extends State<AppNameWidget> {
  final List<String> _appNameDecomposit = [];
  @override
  void initState() {
    super.initState();
    _appNameDecomposit.addAll(AppTexts.appName.split(" ").toList());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(
          _appNameDecomposit[0],
          style: TextConfig.getSimpleTextStyle(
            true,
            size: widget.maxSize,
            font: FontsNames.fontBeautiful,
          ),
        ),
        if (_appNameDecomposit.length > 1)
          Positioned(
            bottom: 0,
            right: -10,
            child: Text(
              _appNameDecomposit[1] + _appNameDecomposit[2],
              style: TextConfig.getSimpleTextStyle(true,
                  size: widget.minSize, color: ColorConfig.primaryColor),
            ),
          ),
      ],
    );
  }
}
