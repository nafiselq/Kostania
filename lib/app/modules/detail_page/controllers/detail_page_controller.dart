import 'package:get/get.dart';
import 'package:rentamate_apps/app/widget/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class DetailPageController extends GetxController {
  //TODO: Implement DetailPageController

  Future<void> launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  getRating(rating) {
    [1, 2, 3, 4, 5].map((e) {
      return Container(
        margin: EdgeInsets.only(left: 2),
        child: RatingItem(
          index: e,
          rating: rating,
        ),
      );
    }).toList();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
