import 'package:flutter_task_kombee_dhruvi_patel/view/bottom_nav_screen/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavController>(BottomNavController());
  }
}
