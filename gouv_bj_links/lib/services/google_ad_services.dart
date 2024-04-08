// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utilities/variables/google_ad_attributs.dart';
import '../utilities/variables/google_ad_initials_keywords.dart';

class GoogleAdServices {
  GoogleAdServices._();
  static final GoogleAdServices INSTANCE = GoogleAdServices._();

  String adUnitId = "";

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }


  Future<void> initSingleInterstitialAd(
      {required Function ready, List<String>? keywords, List<String>? urls}) async {
    InterstitialAd? ad_;
    InterstitialAd.load(
      adUnitId: GoogleAdAttribts.GOOGLE_AD_INTERSTITIAL_ID,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          ad_ = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
    ad_?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
        print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );
    ad_?.show();
  }

  BannerAd initSingleBannerAd(
      {required Function ready, List<String>? keywords, List<String>? urls}) {
    BannerAd bannerAd_ = BannerAd(
      size: AdSize.banner,
      adUnitId: GoogleAdAttribts.GOOGLE_AD_BANNER_ID,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          ready();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: AdRequest(
        keywords: keywords ?? GoogleAdInitialKeywords.keywords,
        nonPersonalizedAds: true,
      ),
    );
    bannerAd_.load();
    return bannerAd_;
  }

  /*NativeAd initSingleNativeAd(
      {required Function ready, List<String>? keywords, List<String>? urls}) {
    NativeAd _nativeAd = NativeAd(
      // adUnitId: GoogleAdAttribts.GOOGLE_AD_NATIVE_ID,
      adUnitId: NativeAd.testAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          ready();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: AdRequest(
        keywords: keywords ?? GoogleAdInitialKeywords.keywords,
        nonPersonalizedAds: true,
      ),
      factoryId: GoogleAdAttribts.GOOGLE_AD_APP_ID,
    );
    _nativeAd.load();
    return _nativeAd;
  }*/
}