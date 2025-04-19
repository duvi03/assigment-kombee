import 'dart:convert';

import 'package:flutter_task_kombee_dhruvi_patel/data/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxList<Category> categoryList = RxList([]);
  var bannerImage = ''.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var url = Uri.parse(
        "https://app-interview.easyglue.in/category_repository.json",
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        bannerImage.value = jsonResponse['banner_image'] ?? '';
        final List<dynamic> categoryDataList = jsonResponse['categories'];
        categoryList.value =
            categoryDataList.map((e) => Category.fromJson(e)).toList();
        // categoryList.value = categoryList.map((e) => Category.fromJson(e)).toList();

        // List data = json.decode(response.body)['category'];

        // categoryList.value = data.map((e) => Category.fromJson(e)).toList();
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
