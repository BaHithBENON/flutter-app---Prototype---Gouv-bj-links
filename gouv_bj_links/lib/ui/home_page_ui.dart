import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../models/model_app_link.dart';
import '../utilities/configs/color_config.dart';
import '../utilities/configs/controller_provider.dart';
import '../utilities/configs/language_model.dart';
import '../utilities/configs/route_config.dart';
import '../utilities/configs/text_config.dart';
import '../utilities/variables/app_texts.dart';
import '../utilities/variables/fonts_names.dart';
import '../utilities/variables/images_sources.dart';
import 'ads/widgets/banner_widget.dart';
import 'setting_ui.dart';
import 'supports/widgets/support_dev_team_question_widget.dart';
import 'link/widgets/link_widget.dart';
import 'widgets/app_logo_widget.dart';
import 'widgets/no_links_widget.dart';
import 'widgets/text_filed_edit_widget.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});
  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  TextEditingController? _searchController;
  String _searchingValue = "";
  bool _texting = false;
  bool _searching = false;


  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController!.dispose();
    super.dispose();
  }

  void _showSupportBox() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).backgroundColor,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: SupportDevTeamQuestionWidget(),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: _showSupportBox,
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: ColorConfig.primaryColor,
          child: Center(
            child: Icon(TablerIcons.gift, color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: (!_texting && !_searching) ? 13 : 2),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorConfig.primaryColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //
                      if(!_texting && !_searching)...[
                        SizedBox(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              ImagesSources.gbjlink_bg_dark_2,
                              //fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              //height: 40,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.asset(ControllersProvider.SPLASH_CONTROLLER.randomGouvSloImage(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _searching = true;
                            });
                          },
                          child: const Icon(TablerIcons.search,
                              color: Colors.white,),
                        ),
                      ] else ...[
                        if(_searchController != null)...[
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFieldEditWidget(
                                controller: _searchController!,
                                withEraser: false,
                                hint: "${LanguageConfig.translate(context).toSearch}...",
                                keyboardType: TextInputType.text,
                                background: ColorConfig.primaryColor,
                                textColor: Colors.white,
                                onChange: (value) {
                                  if(value.isNotEmpty) {
                                    setState(() {
                                      _texting = true;
                                      _searchingValue = value;
                                    });
                                  } else {
                                    setState(() {
                                      _texting = false;
                                      _searchingValue = "";
                                    });
                                  }
                                },
                                withTitleWhenTexting: false,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _searchingValue = "";
                                _searchController?.clear();
                                _searching = false;
                                _texting = false;
                              });
                            },
                            child: const Icon(TablerIcons.x,
                              color: Colors.white,),
                          ),
                        ],
                      ],
                      if(!_texting && !_searching)...[
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            RouteConfig.to(page: const SettingUI(), context: context);
                          },
                          child: const Icon(TablerIcons.dots_vertical,
                              color: Colors.white,),
                        ),
                      ],
                      
                    ],
                  ),
                ),
                // Other
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(_searchingValue.isEmpty)...[
                          /*const SizedBox(height: 10),
                          Text(LanguageConfig.translate(context).allInFamousBenin.toUpperCase(),
                            style: TextConfig.getSimpleTextStyle(true,
                              size: 16,
                            ),
                          ),*/
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Text.rich(
                              TextSpan(
                                text: "${AppTexts.appName} ", 
                                children: [
                                  TextSpan(
                                    text: "| ${LanguageConfig.translate(context).appDescription2}",
                                    style: TextConfig.getSimpleTextStyle(true, color: ColorConfig.getTextColor(context)),
                                  ),
                                ],
                                style: TextConfig.getSimpleTextStyle(
                                  true, color: ColorConfig.thirdColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const BannerWidget(),
                          const SizedBox(height: 20),
                        ],
                        // Banner
                        //
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: ColorConfig.primaryColor.withOpacity(.09),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text("-${LanguageConfig.translate(context).differentsLinks.toUpperCase()}-",
                          textAlign: TextAlign.center,
                            style: TextConfig.getSimpleTextStyle(true,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //
                        //
                        StreamBuilder<List<ModelAppLink>>(
                          stream: ControllersProvider.LINK_CONTROLLER.getLinks(),
                          builder: ((context, snapshot) {
            
                            List<ModelAppLink> links = List.castFrom([]);
                            List<ModelAppLink> linkSort = List.castFrom([]);
            
                            if(snapshot.hasData && snapshot.data != null) {
                              links = snapshot.data ?? List.castFrom([]);
                              if(links.isNotEmpty) {
                                //
                                if(_searchingValue.isNotEmpty) {
                                  //
                                  for (var item in links) {
                                    if(item.linkDetails!.toLowerCase().contains(_searchingValue.toLowerCase()) ||
                                      item.linkName!.toLowerCase().contains(_searchingValue.toLowerCase()) ||
                                      item.linkUrl!.toLowerCase().contains(_searchingValue.toLowerCase())) {
                                        if (linkSort.where((element) =>
                                          element.modelId == item.modelId).toList().isEmpty) {
                                          linkSort.add(item);
                                        }
                                    }
                                  }
                                  //
                                  if(linkSort.isNotEmpty) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for(ModelAppLink link in linkSort)...[
                                          LinkWidget(modelAppLink: link),
                                          const SizedBox(height: 10),
                                          if(link != links.last)
                                            Divider(
                                              color: ColorConfig.getInputColor(context),
                                              thickness: 2.0,
                                            ),
                                        ],
                                      ],
                                    );
                                  } else {
                                    return const NoLinksWidget();
                                  }
                                } else {
                                  return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for(ModelAppLink link in links)...[
                                          LinkWidget(modelAppLink: link),
                                          const SizedBox(height: 10),
                                          if(link != links.last)
                                            Divider(
                                              color: ColorConfig.getInputColor(context),
                                              thickness: 2.0,
                                            ),
                                        ],
                                        const SizedBox(height: 100),
                                      ],
                                    );
                                }
                              } else {
                                return const NoLinksWidget();
                              }
                            } else if(snapshot.connectionState == ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                child: Center(
                                  child:  CircularProgressIndicator()
                                ),
                              );
                            } else {
                              return const NoLinksWidget();
                            }
                          }),
                        ),
            
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}