import 'package:flutter/material.dart';

import '../../../utilities/configs/color_config.dart';
import '../../../utilities/variables/enums.dart';
import '../../services/theme_mode_service.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/text_config.dart';
import 'button_widget.dart';

class ThemesWidget extends StatefulWidget {
  const ThemesWidget({Key? key}) : super(key: key);
  @override
  State<ThemesWidget> createState() => _ThemesWidgetState();
}

class _ThemesWidgetState extends State<ThemesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text("${LanguageConfig.translate(context).actualTheme} : ${ThemeModeService.INSTANCE.getActualTheme(context)}",
            style: TextConfig.getSimpleTextStyle(true),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Material(
                  child: ButtonWidget(
                    background: Theme.of(context).cardColor,
                    text: LanguageConfig.translate(context).light,
                    onTap: () {
                      Navigator.pop(context);
                      ThemeModeService.INSTANCE
                          .changeTheme(context, mode: AppThemeMode.Light);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Material(
                  child: ButtonWidget(
                    background: ColorConfig.getTextColor(context),
                    textColor: ColorConfig.getTextColorInverse(context),
                    text: LanguageConfig.translate(context).dark,
                    onTap: () {
                      Navigator.pop(context);
                      ThemeModeService.INSTANCE
                          .changeTheme(context, mode: AppThemeMode.Dark);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
