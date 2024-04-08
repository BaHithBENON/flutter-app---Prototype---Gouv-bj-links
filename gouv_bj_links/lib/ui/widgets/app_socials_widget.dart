import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/model_app_link.dart';
import '../../services/general_services.dart';
import '../../utilities/configs/controller_provider.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/text_config.dart';

class AppSocialsWidget extends StatelessWidget {
  const AppSocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ModelAppLink>>(
      stream: ControllersProvider.LINK_CONTROLLER.getAppLinks(),
      builder: (context, snapshot) {
        List<ModelAppLink> links = List.castFrom([]);
        if(snapshot.hasData && snapshot.data != null) {
          links = snapshot.data ?? List.castFrom([]);
          if(links.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LanguageConfig.translate(context).contactsAndSocialNetwork,
                    style: TextConfig.getSimpleTextStyle(true),
                  ),
                  const SizedBox(height: 10),
                  for(ModelAppLink link in links)...[
                    InkWell(
                      onTap: () {
                        if(link.linkUrl != null) {
                          Uri uri = Uri.parse(link.linkUrl ?? "");
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
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(link.linkName ?? "",
                                style: TextConfig.getSimpleTextStyle(true),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () async {
                                await GeneralServices.INSTANCE
                                    .shareToAnotherApp(context, text: link.linkUrl);
                              },
                              child: const Icon(TablerIcons.share),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
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