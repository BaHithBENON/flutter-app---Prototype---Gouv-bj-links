import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/model_app_update.dart';
import '../services/app_infos_services.dart';
import '../services/general_services.dart';
import '../utilities/configs/color_config.dart';
import '../utilities/configs/controller_provider.dart';
import '../utilities/configs/language_model.dart';
import '../utilities/configs/text_config.dart';
import '../utilities/variables/app_texts.dart';
import 'languages/language_choice_widget.dart';
import 'supports/widgets/support_dev_team_question_widget.dart';
import 'widgets/app_logo_widget.dart';
import 'widgets/app_socials_widget.dart';
import 'widgets/boutton_second_type_widget.dart';
import 'widgets/themes_widget.dart';

class SettingUI extends StatelessWidget {
  const SettingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // await GoogleAdServices.INSTANCE.initSingleInterstitialAd(ready: () {});
                    },
                    child: const Icon(TablerIcons.x, size: 25),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppLogoWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 00),
                            // CountryImagesWidget(),
                            const SizedBox(height: 30),
                            ButtonSecondTypeWidget(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  context: context,
                                  builder: (context) {
                                    return const SingleChildScrollView(child: ThemesWidget());
                                });
                              },
                              icon: const Icon(TablerIcons.palette),
                              content: LanguageConfig.translate(context).appThemes,
                            ),
                            const SizedBox(height: 10),
                            ButtonSecondTypeWidget(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  context: context,
                                  builder: (context) {
                                    return const SingleChildScrollView(child: LanguageChoiceWidget());
                                });
                              },
                              icon: const Icon(TablerIcons.language),
                              content: LanguageConfig.translate(context).appLanguages,
                            ),
                            const SizedBox(height: 10),
                            StreamBuilder<ModelAppUpdate>(
                              stream: ControllersProvider.SETTING_CONTROLLER.getAppUpdates(),
                              builder: (context, snapshot) {
                                ModelAppUpdate? up;
                                if(snapshot.hasData && snapshot.data != null) {
                                  up = snapshot.data;
                                  if(up != null && up.linkUrl != null) {
                                    return ButtonSecondTypeWidget(
                                      onTap: () async {
                                        if(up?.linkUrl != null) { 
                                          await GeneralServices.INSTANCE
                                            .shareToAnotherApp(context, text: up?.linkUrl ?? "");
                                        } else {
                                          Get.rawSnackbar(
                                            message: LanguageConfig.translate(context).checkInternetAndRetry,
                                            isDismissible: false,
                                            duration: const Duration(seconds: 1),
                                            icon: const Icon(Icons.wifi_off, color: Colors.white,),
                                            snackStyle: SnackStyle.GROUNDED,
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        }
                                      },
                                      icon: const Icon(TablerIcons.share),
                                      content: LanguageConfig.translate(context).sharedApp,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                            const SizedBox(height: 30),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: ColorConfig.primaryColor.withOpacity(.8),
                              ),
                              child: SupportDevTeamQuestionWidget(detailsColor: Colors.white),),
                            const SizedBox(height: 30),
                            const AppSocialsWidget(),
                            const SizedBox(height: 30),
                            FutureBuilder<PackageInfo>(
                              future: AppInfosServices.INSTANCE.packageInfos,
                              builder: (context, snapshot) {
                                PackageInfo? packageInfo = snapshot.data;
                                if(packageInfo != null) {
                                  return Text(
                                    "${packageInfo.appName}.\n${LanguageConfig.translate(context).version} ${packageInfo.version.toUpperCase()}",
                                    style: TextConfig.getSimpleTextStyle(true),
                                  );
                                } return const SizedBox();
                              },
                            ),
                            const SizedBox(height: 0),
                            Text("${LanguageConfig.translate(context).madeBy} ${AppTexts.appCreator}。",
                              style: TextConfig.getSimpleTextStyle(true, size: 10),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}