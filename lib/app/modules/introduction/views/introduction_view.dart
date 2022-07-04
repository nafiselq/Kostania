import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:rentamate_apps/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Kamu hanya perlu dirumah saja untuk mendapatkan teman baru",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json")),
          ),
        ),
        PageViewModel(
          title: "Temukan Sahabat Baru",
          body:
              "Jika kamu memang jodoh karena aplikasi ini, kami sangat bahagia",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(child: Lottie.asset("assets/lottie/ojek.json")),
          ),
        ),
        PageViewModel(
          title: "Temukan pengalaman dengan teman baru",
          body: "Kamu bisa menemukan pengalaman dengan teman barumu!",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(child: Lottie.asset("assets/lottie/payment.json")),
          ),
        ),
        PageViewModel(
          title: "Gabung Sekarang Juga",
          body: "Kamu tidak akan rugi juga gabung sekarang",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(child: Lottie.asset("assets/lottie/register.json")),
          ),
        ),
      ],
      onDone: () => Get.offAllNamed(Routes.LOGIN),
      showSkipButton: true,
      skip: Text("Skip"),
      next: Text("Next", style: TextStyle(fontWeight: FontWeight.bold)),
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
    ));
  }
}
