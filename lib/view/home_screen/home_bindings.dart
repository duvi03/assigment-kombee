import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
