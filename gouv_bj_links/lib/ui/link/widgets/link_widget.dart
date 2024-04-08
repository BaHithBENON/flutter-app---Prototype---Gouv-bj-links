// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/model_app_link.dart';
import '../../../models/model_click.dart';
import '../../../services/general_services.dart';
import '../../../services/preferences_services.dart';
import '../../../utilities/configs/color_config.dart';
import '../../../utilities/configs/controller_provider.dart';
import '../../../utilities/configs/language_model.dart';
import '../../../utilities/configs/route_config.dart';
import '../../../utilities/configs/text_config.dart';
import '../../../utilities/variables/app_texts.dart';
import '../../../utilities/variables/enums.dart';
import '../../webview/app_webview_ui.dart';
import 'link_more_widget.dart';

class LinkWidget extends StatelessWidget {
  ModelAppLink modelAppLink;
  LinkWidget({super.key, required this.modelAppLink});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String details = "";
    
    if(modelAppLink.titles != null &&
      modelAppLink.titles!.where((element) => element.languageCode == PreferencesServices.INSTANCE.appLanguage).isNotEmpty){
      title = modelAppLink.titles!.where((element) => element.languageCode == PreferencesServices.INSTANCE.appLanguage).first.context ?? modelAppLink.linkName ?? "";
    } else {
      title = modelAppLink.linkName ?? "";
    }

    if(modelAppLink.details != null &&
      modelAppLink.details!.where((element) => element.languageCode == PreferencesServices.INSTANCE.appLanguage).isNotEmpty){
      details = modelAppLink.details!.where((element) => element.languageCode == PreferencesServices.INSTANCE.appLanguage).first.context ?? modelAppLink.linkDetails ?? "";
    } else {
      details = modelAppLink.linkDetails ?? "";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        InkWell(
          onTap: () async {
            RouteConfig.to(page: AppWebviewUI(
              link: modelAppLink.linkUrl,
              title: title,
            ), context: context);
            ReturnStatus? status;
            if(modelAppLink.modelId != null) {
              status = await ControllersProvider.CLICK_CONTROLLER.updateClickOnLink(linkId: modelAppLink.modelId ?? "");
            }
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
             // color: Theme.of(context).cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextConfig.getSimpleTextStyle(true, size: 18),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80, width: 80,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).cardColor,
                      ),
                      child: (modelAppLink.linkImages != null && modelAppLink.linkImages!.isNotEmpty) ?
                        CachedNetworkImage(
                          imageUrl: modelAppLink.linkImages![0].fileUrl ?? "",
                          fit: BoxFit.cover,
                          errorWidget: (context, _, __) {
                            return const Center(
                              child: Icon(TablerIcons.link),
                            );
                          },
                          progressIndicatorBuilder: (context,
                                  url, downloadProgress) =>
                              LinearProgressIndicator(
                            value: downloadProgress.progress,
                            color: ColorConfig.primaryColor,
                            backgroundColor: ColorConfig.primaryColor,
                          ),
                        ) : const Center(
                          child: Icon(TablerIcons.link),
                        ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(modelAppLink.linkUrl ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextConfig.getSimpleTextStyle(true, color: ColorConfig.thirdColor, size: 10),
                          ),
                          Text(details,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextConfig.getSimpleTextStyle(false, color: ColorConfig.getLinkTextColor(context)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: StreamBuilder<List<ModelClick>>(
                stream: ControllersProvider.CLICK_CONTROLLER.getClicksOnLinks(linkId: modelAppLink.modelId ?? ""),
                builder: (context, snapshot) {
                  List<ModelClick> list = List.castFrom([]);
                  int counter = 0;
                  if(snapshot.hasData) {
                    list = snapshot.data ?? List.castFrom([]);
                    if(list.isNotEmpty) counter = list[0].clickCounter ?? 0;
                  }
                  return Text("${LanguageConfig.translate(context).visitorNumber} : ${NumberFormat.compact().format(counter)}",
                    style: TextConfig.getSimpleTextStyle(true, size: 12),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () async {
                if(modelAppLink.linkUrl != null) { 
                  String sharingContext_ = "$title\n${modelAppLink.linkUrl ?? ""}\n$details\n\n"
                  "${LanguageConfig.translate(context).madeBy} ${AppTexts.appName} 。";
                  await GeneralServices.INSTANCE
                    .shareToAnotherApp(context, text: sharingContext_);
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
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorConfig.primaryColor,
                ),
                child: const Icon(TablerIcons.share, color: Colors.white,),),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return LinkMoreWidget(infos: details, link: modelAppLink.linkUrl ?? "", modelAppLink: modelAppLink,);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorConfig.primaryColor,
                ),
                child: Text("${LanguageConfig.translate(context).infos}...".toUpperCase(), 
                  style: TextConfig.getSimpleTextStyle(true, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}