import 'package:flutter/material.dart';
import '../../utilities/variables/app_texts.dart';
import '../../utilities/variables/fonts_names.dart';
import '../../utilities/configs/color_config.dart';
import '../../utilities/configs/route_config.dart';
import '../../utilities/configs/text_config.dart';
import '../utilities/configs/language_model.dart';
import 'supports/click_counter_ui.dart';
//import 'widgets/app_logo_widget.dart';
import 'widgets/app_logo_widget.dart';
import 'widgets/button_widget.dart';

class StarterUI extends StatelessWidget {
  const StarterUI({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppLogoWidget(),
              ),
              /*Padding( 
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(AppTexts.appName,
                  style: TextConfig.getSimpleTextStyle(true,
                    font: FontsNames.fontBeautiful, size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "${AppTexts.appName} ", 
                        children: [
                          TextSpan(
                            text: "| ${LanguageConfig.translate(context).appDescription2}",
                            style: TextConfig.getSimpleTextStyle(true, color: ColorConfig.getTextColor(context)),
                          ),
                        ],
                        style: TextConfig.getSimpleTextStyle(
                          true, color: ColorConfig.thirdColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      text: "${LanguageConfig.translate(context).discover} ${AppTexts.appName}",
                      background: ColorConfig.primaryColor,
                      textColor: Colors.white,
                      onTap: () {
                        RouteConfig.to(page: const ClickCounterUI(), context: context, withReplacement: true);
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
