import 'package:flutter/material.dart';

import '../../utilities/configs/color_config.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/text_config.dart';

class NoLinksWidget extends StatelessWidget {
  const NoLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConfig.getInputColor(context),
      ),
      child: Center(
        child: Text(LanguageConfig.translate(context).noLinksForInstant,
          textAlign: TextAlign.center,
          style: TextConfig.getSimpleTextStyle(true),
        ),
      ),
    );
  }
}