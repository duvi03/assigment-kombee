import 'package:flutter/material.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/bottom_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/middel_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/top_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  late PageController unStitchedPageController = PageController();
  late PageController boutiquePageController = PageController();
  final RxInt activePage = 0.obs;
  final RxDouble currentPage = 0.0.obs;

  RxBool isLoading = RxBool(true);
  RxList<MainStickyMenu> mainStickyMenuList = RxList([]);
  RxList<MainStickyMenu> selectedSliderImagesList = RxList([]);
  RxList<ShopBy> shopByCategoryList = RxList([]);
  RxList<ShopBy> shopByFabricList = RxList([]);
  RxList<Unstitched> unstitchedList = RxList([]);
  RxList<BoutiqueCollection> boutiqueCollectionList = RxList([]);
  RxList<RangeOfPattern> rangeOfPatternList = RxList([]);
  RxList<DesignOccasion> designOccasionList = RxList([]);

  @override
  void onInit() {
    fetchTopRepository();
    fetchMiddleRepository();
    fetchBottomRepository();
    super.onInit();
    unStitchedPageController.addListener(() {
      currentPage.value = unStitchedPageController.page!;
    });
  }

  Future fetchTopRepository() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("https://app-interview.easyglue.in/top_repository.json"),
      );

      if (response.statusCode == 200) {
        print("fetchTopRepositorySuccess");
        TopModel topModel = TopModel.fromRawJson(response.body);
        mainStickyMenuList.value = topModel.mainStickyMenu;
        mainStickyMenuList.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
        selectedSliderImagesList.value =
            mainStickyMenuList[0].sliderImages ?? [];
        print(mainStickyMenuList);
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

  Future fetchMiddleRepository() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/middle_repository.json"),
      );

      if (response.statusCode == 200) {
        print("fetchMiddleRepositorySuccess");
        MiddleModel middleModel = MiddleModel.fromRawJson(response.body);
        shopByCategoryList.value = middleModel.shopByCategory;
        shopByFabricList.value = middleModel.shopByFabric;
        unstitchedList.value = middleModel.unstitched;
        boutiqueCollectionList.value = middleModel.boutiqueCollection;
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

  Future fetchBottomRepository() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/bottom_repository.json"),
      );

      if (response.statusCode == 200) {
        print("fetchBottomRepositorySuccess");
        BottomModel bottomModel = BottomModel.fromRawJson(response.body);
        rangeOfPatternList.value = bottomModel.rangeOfPattern;
        designOccasionList.value = bottomModel.designOccasion;
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
