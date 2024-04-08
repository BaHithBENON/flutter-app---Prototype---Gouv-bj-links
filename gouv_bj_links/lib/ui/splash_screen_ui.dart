import 'package:flutter/material.dart';

import '../utilities/configs/color_config.dart';
import '../utilities/configs/controller_provider.dart';
import '../utilities/configs/language_model.dart';
import '../utilities/configs/text_config.dart';
import '../utilities/variables/app_texts.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});


  @override
  Widget build(BuildContext context) {
    ControllersProvider.SPLASH_CONTROLLER.startAnimation(context);
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Image(
                image: AssetImage(ControllersProvider.SPLASH_CONTROLLER.randomImage())
              ),
            ),
          ),
          //Text(AppTexts.appName, style: TextConfig.getSimpleTextStyle(true, size: 30, color: Colors.white),),
          Text("${LanguageConfig.translate(context).madeBy} ${AppTexts.appCreator}。",
            style: TextConfig.getSimpleTextStyle(true, size: 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}