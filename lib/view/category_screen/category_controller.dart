import 'package:flutter_task_kombee_dhruvi_patel/data/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isBack = RxBool(false);
  Rxn<CategoryModel> categoryModel = Rxn();
  RxList<Category> categoryList = RxList([]);
  RxList<Category> subCategoryList = RxList([]);

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("https://app-interview.easyglue.in/category_repository.json"),
      );

      if (response.statusCode == 200) {
        print("fetchCategoriesSuccess");
        categoryModel.value = CategoryModel.fromRawJson(response.body);
        categoryList.value = categoryModel.value?.categories ?? [];
        print(categoryList);
      } else {
        Get.snackbar("Error", "Failed to load categories");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
