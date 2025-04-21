import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_assets.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/boutique_collection_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/design_as_occasion_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/main_menu_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/range_of_pattern_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/shop_by_category_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/shop_by_fabric_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/widget/unstitched_view.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Image.asset(AppAssets.headerImage, height: 180.h),
        actions: [
          Icon(Icons.search, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
          Icon(Icons.shopping_bag_outlined, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
        ],
      ),
      body: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                MainMenuView(),
                ShopByCategoryView(),
                ShopByFabricView(),
                UnstitchedView(),
                BoutiqueCollectionView(),
                RangeOfPatternView(),
                DesignAsOccasionView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
