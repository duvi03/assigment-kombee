import 'package:flutter_task_kombee_dhruvi_patel/view/category_screen/category_controller.dart';
import 'package:get/get.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
