import 'package:get/get.dart';
import 'package:rentamate_apps/app/model/space.dart';
import 'package:rentamate_apps/app/model/space_model.dart';
import 'package:rentamate_apps/app/services/Services.dart';

class HomeController extends GetxController {
  var cart = 15.obs;
  Services services = Services();
  var getSpace = <Space>[].obs;

  callMethodGet() async {
    try {
      var result = await services.getRecommended();
      if (result != null) {
        getSpace.assignAll(result);
      }
      print("getspace \n$getSpace");
    } catch (e) {
      print(e);
    }
    update();
  }

  @override
  void onInit() {
    callMethodGet();
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
}
