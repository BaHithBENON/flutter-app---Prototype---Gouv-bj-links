import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../utilities/configs/controller_provider.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/route_config.dart';
import '../../utilities/configs/text_config.dart';
import '../home_page_ui.dart';
import 'new_update_available_widget.dart';

class NewAppVersionAvailableUI extends StatelessWidget {
  const NewAppVersionAvailableUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      ControllersProvider.put();
                      RouteConfig.to(page: const HomePageUI(), context: context, withReplacement: true);
                    },
                    child: const Icon(TablerIcons.x, size: 25),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                LanguageConfig.translate(context).newUpdateAvailable,
                style: TextConfig.getSimpleTextStyle(true,
                  size: 25),
              ),
              const NewUpdateAvailableWidget(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}