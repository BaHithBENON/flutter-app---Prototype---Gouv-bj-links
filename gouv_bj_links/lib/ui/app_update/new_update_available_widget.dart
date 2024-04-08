import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../models/model_app_update.dart';
import '../../services/app_infos_services.dart';
import '../../services/general_services.dart';
import '../../utilities/configs/color_config.dart';
import '../../utilities/configs/controller_provider.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/route_config.dart';
import '../../utilities/configs/text_config.dart';
import '../home_page_ui.dart';
import '../widgets/button_widget.dart';

class NewUpdateAvailableWidget extends StatelessWidget {
  const NewUpdateAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ModelAppUpdate>(
      stream: ControllersProvider.SETTING_CONTROLLER.getAppUpdates(),
      builder: (context, snapshot) {
        ModelAppUpdate? up;
        if(snapshot.hasData && snapshot.data != null) {
          up = snapshot.data;
          if(up != null && up.newAppVersion != null) {
            return FutureBuilder<PackageInfo>(
              future: AppInfosServices.INSTANCE.packageInfos,
              builder: (context, snapshot) {
                PackageInfo? packageInfo = snapshot.data;
                if(packageInfo != null) {
                  if(packageInfo.version != up!.newAppVersion || packageInfo.buildNumber != up.buildNumber) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 00, vertical: 20),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonWidget(
                            background: ColorConfig.primaryColor,
                            text: LanguageConfig.translate(context).update,
                            textAlign: TextAlign.center,
                            textColor: Colors.white,
                            onTap: () async {
                              if(up != null && up.linkUrl != null) {
                                Uri uri = Uri.parse(up.linkUrl ?? "");
                                GeneralServices.INSTANCE.launchInBrowser(uri);
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
                          ),
                          if(up.isForced == null || (up.isForced != null && !up.isForced!) )...[
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                ControllersProvider.put();
                                RouteConfig.to(page: const HomePageUI(), context: context, withReplacement: true);
                              },
                              child: Text(LanguageConfig.translate(context).skip.toUpperCase(),
                                style: TextConfig.getSimpleTextStyle(true),
                              ),
                            ),
                          ],
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  }
                } return const SizedBox();
              },
            );
          } else {
            return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}