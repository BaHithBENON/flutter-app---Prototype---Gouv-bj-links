// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';

import '../../../models/model_app_link.dart';
import '../../../services/general_services.dart';
import '../../../utilities/configs/color_config.dart';
import '../../../utilities/configs/controller_provider.dart';
import '../../../utilities/configs/language_model.dart';
import '../../../utilities/configs/route_config.dart';
import '../../../utilities/configs/text_config.dart';
import '../../../utilities/variables/enums.dart';
import '../../webview/app_webview_ui.dart';
import '../../widgets/button_widget.dart';

class LinkMoreWidget extends StatelessWidget {
  String infos;
  String link;
  String? title;
  ModelAppLink modelAppLink;
  LinkMoreWidget({super.key, required this.infos, required this.link, this.title, required this.modelAppLink});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LanguageConfig.translate(context).infos,
            style: TextConfig.getSimpleTextStyle(true),
          ),
          const SizedBox(height: 20),
          SelectableText(link,
            style: TextConfig.getSimpleTextStyle(true, color: ColorConfig.primaryColor, size: 10),
          ),
          const SizedBox(height: 10),
          SelectableText(infos,
            style: TextConfig.getSimpleTextStyle(false),
          ),
          const SizedBox(height: 10),
          ButtonWidget(
            background: ColorConfig.primaryColor,
            text: LanguageConfig.translate(context).visitedLink,
            textAlign: TextAlign.center,
            textColor: Colors.white,
            onTap: () async {
              Uri uri = Uri.parse(link);
              GeneralServices.INSTANCE.launchInBrowser(uri);
              RouteConfig.to(page: AppWebviewUI(
                link: link,
                title: title,
              ), context: context);
              ReturnStatus? status;
              if(modelAppLink.modelId != null) {
                status = await ControllersProvider.CLICK_CONTROLLER.updateClickOnLink(linkId: modelAppLink.modelId ?? "");
              }
            }
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}