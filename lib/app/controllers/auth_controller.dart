import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isSkip = false.obs;
  var isAuth = false.obs;

  Future<void> firstInitialized() async {}

  Future<bool> skipIntro() async {
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      isSkip.value = true;
    }
    return false;
  }

  Future<void> login() async {}
}
