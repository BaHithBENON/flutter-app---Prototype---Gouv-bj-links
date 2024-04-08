import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/model_app_update.dart';
import '../services/app_infos_services.dart';
import '../services/auth_verify_service.dart';
import '../ui/app_update/new_update_available_ui.dart';
import '../utilities/configs/controller_provider.dart';
import '../utilities/configs/route_config.dart';
import '../utilities/variables/images_sources.dart';

class SplashController extends GetxController {

  RxBool animate = false.obs;

  
  Future startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));

    ModelAppUpdate version = await ControllersProvider.SETTING_CONTROLLER.getAppVersions().timeout(
      const Duration(seconds: 10), 
      /*onTimeout: () async {
        return FutureOr<ModelAppUpdate>;
      }*/
    );
    PackageInfo packageInfo = await AppInfosServices.INSTANCE.packageInfos;
    if((version.newAppVersion != packageInfo.version || version.buildNumber != packageInfo.buildNumber)) {
      RouteConfig.to(page: const NewAppVersionAvailableUI(), context: context, withReplacement: true);
    } else {
      RouteConfig.to(page: AuthVerifyService.INSTANCE.startPage, context: context, withReplacement: true);
    }
  }

  String randomImage() {
    List<String> images =  [
      ImagesSources.graph,
      ImagesSources.graph_1,
      ImagesSources.graph_2,
      ImagesSources.graph_3,
      ImagesSources.graph_4,
      ImagesSources.graph_5,
      ImagesSources.graph_6,
    ];

    int rand = Random().nextInt(images.length - 1);
    // return images[rand];
    return ImagesSources.gbjlink_bg_dark;
  }

  String randomGouvSloImage() {
    List<String> images =  [
      ImagesSources.gouv_slogan_yellow,
      ImagesSources.gouv_slogan_light,
    ];

    int rand = Random().nextInt(images.length - 1);
    return images[rand];
  }
}