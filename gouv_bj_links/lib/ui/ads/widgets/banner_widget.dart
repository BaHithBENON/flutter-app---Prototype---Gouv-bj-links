import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../services/google_ad_services.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}


class _BannerWidgetState extends State<BannerWidget> {

  BannerAd? bannerAd;

  @override
  void initState() {
    bannerAd = GoogleAdServices.INSTANCE.initSingleBannerAd(
      ready: () {}
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    if(bannerAd != null) {
      return Center(
        child: SizedBox(
          width: bannerAd?.size.width.toDouble(),
          height:  bannerAd?.size.height.toDouble(),
          child: AdWidget(
            ad: bannerAd!,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}