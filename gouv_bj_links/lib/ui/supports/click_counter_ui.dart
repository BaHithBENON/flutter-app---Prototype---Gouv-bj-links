// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../models/model_app_link.dart';
import '../../models/model_click.dart';
import '../../utilities/configs/color_config.dart';
import '../../utilities/configs/controller_provider.dart';
import '../../utilities/configs/language_model.dart';
import '../../utilities/configs/route_config.dart';
import '../../utilities/configs/text_config.dart';
import '../home_page_ui.dart';

class ClickCounterUI extends StatelessWidget {
  const ClickCounterUI({super.key});

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
                padding: const EdgeInsets.only(top: 10, right: 00),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      RouteConfig.to(page: const HomePageUI(), context: context, withReplacement: true);
                    },
                    child: const Icon(TablerIcons.x, size: 25),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                LanguageConfig.translate(context).todayWeCounted,
                style: TextConfig.getSimpleTextStyle(true,
                  size: 25),
              ),
              StreamBuilder<List<ModelAppLink>>(
                stream: ControllersProvider.LINK_CONTROLLER.getLinks(),
                builder: (context, snapshot) {
                  List<Stream<List<ModelClick>>> streams = [];
                  if(snapshot.data != null && snapshot.data!.isNotEmpty) {
                    for (var item in snapshot.data!) {
                      streams.add(ControllersProvider.CLICK_CONTROLLER.getClicksOnLinks(linkId: item.modelId ?? ""));
                    }
                  }
                  return StreamBuilder<List<List<ModelClick>>>(
                    stream: rx.CombineLatestStream.list([
                      ...streams,
                    ]),
                    builder: (context, snapshotClicks) {
                      int counter = 0;
                      if(snapshotClicks.hasData) {
                        for (var element in snapshotClicks.data!) {
                          if(element.isNotEmpty) counter += element[0].clickCounter ?? 0;
                        }
                      }
                      return Text("${NumberFormat.compact().format(counter - 1)}...",
                        style: TextConfig.getSimpleTextStyle(true, color: ColorConfig.primaryColor, size: 50),
                      );
                    },
                  );
                },
              ),
              Text(LanguageConfig.translate(context).visitsOfLinks,
                style: TextConfig.getSimpleTextStyle(true, size: 25),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}