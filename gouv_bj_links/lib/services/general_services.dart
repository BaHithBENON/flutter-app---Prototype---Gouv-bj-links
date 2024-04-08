// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class GeneralServices {
  GeneralServices._();
  static final GeneralServices INSTANCE = GeneralServices._();

  int MAX_IMAGES_AD = 10;
  int MAX_IMAGES_POST = 12;
  int MAX_IMAGES_MESSAGE = 20;

  // 
  int COUNT_ADS_01_M = 20;
  int COUNT_ADS_12_M = 15; 
  int COUNT_AD_UNIQUE_05 = 5; 
  int COUNT_AD_UNIQUE_10 = 10; 
  int COUNT_PACK_FULL_01_M = 20;
  int COUNT_PACK_FULL_12_M = 30;
  // 

  Future shareToAnotherApp(BuildContext context,
      {String? text,
      String? subject,
      List<String>? filesPaths,
      bool? withEmptyOrigin}) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (filesPaths != null && filesPaths.isNotEmpty) {
      List<XFile> xFiles = [];
      for (var element in filesPaths) {
        xFiles.add(XFile(element));
      }
      if(xFiles.isNotEmpty) {
        await Share.shareXFiles(
          xFiles,
          text: text ?? '',
          subject: subject ?? '',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        );
      }
    } else {
      await Share.share(
        text ?? '',
        subject: subject ?? '',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }
  }

  void copyContext({required String context}) {
    Clipboard.setData(ClipboardData(text: context));
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      message: "Texte copié",
      borderRadius: 4,
      // icon: const Icon(Icons.copy_rounded),
      // padding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  Future<void> launchUrl_ (String url) async {
    final Uri url_ = Uri.parse(url);
    if(!await launchUrl(url_)) {
      throw 'Could not launch $url_';
    }
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
