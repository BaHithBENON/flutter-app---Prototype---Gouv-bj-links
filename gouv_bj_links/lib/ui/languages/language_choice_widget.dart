import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../utilities/configs/language_model.dart';
import '../widgets/button_widget.dart';

class LanguageChoiceWidget extends StatelessWidget {
  const LanguageChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(var lang in LanguageModel.languageList()) 
            ...[
              ButtonWidget(
                background: Theme.of(context).cardColor,
                text: lang.name,
                textAlign: TextAlign.left,
                onTap: () {
                  Get.back();
                  MyApp.setLocale(context, Locale(lang.languageCode, ''));
                },
              ),
              const SizedBox(height: 10),
            ]
        ],
      ),
    );
  }
}