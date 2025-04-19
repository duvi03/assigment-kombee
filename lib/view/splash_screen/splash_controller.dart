import 'package:flutter_task_kombee_dhruvi_patel/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () async {
      Get.offNamed(RoutesName.bottomNavView);
    });
  }
}
