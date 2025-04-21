import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/category_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/category_screen/category_controller.dart';
import 'package:get/get.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Obx(() {
          return controller.isBack.value
              ? GestureDetector(
                onTap: () {
                  controller.subCategoryList.value = [];
                  controller.isBack.value = false;
                },
                child: Icon(Icons.arrow_back_ios_new),
              )
              : Container();
        }),
        title: AppText(
          'Category Screen',
          textSize: TextSize.title_18,
          textWeight: TextWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.search, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
          Icon(Icons.shopping_bag_outlined, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
        ],
      ),
      body: GetX<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (controller.subCategoryList.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.subCategoryList.length,
              itemBuilder: (context, index) {
                Category item = controller.subCategoryList[index];
                return Container(
                  height: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 4.h),

                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.network(
                          controller.categoryModel.value?.bannerImage ?? "",
                          width: 160.w,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: AppColors.colorList[index %
                                    AppColors.colorList.length],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.sp),
                                  bottomRight: Radius.circular(50.sp),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                  item.categoryName,
                                  textSize: TextSize.large_16,
                                  textWeight: TextWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          120.horizontalSpace,
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return ListView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              Category item = controller.categoryList[index];
              return InkWell(
                splashColor: Colors.grey.withAlpha((0.3 * 255).toInt()),
                highlightColor: Colors.grey.withAlpha((0.1 * 255).toInt()),
                onTap: () {
                  controller.subCategoryList.value =
                      controller.categoryList[index].child ?? [];
                  controller.isBack.value = true;
                },
                child: Container(
                  height: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  color: AppColors.splashColor,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.network(
                          controller.categoryModel.value?.bannerImage ?? "",
                          width: 160.w,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.colorList[index %
                                        AppColors.colorList.length],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.sp),
                                  bottomRight: Radius.circular(50.sp),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                  item.categoryName,
                                  textSize: TextSize.large_16,
                                  textWeight: TextWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          120.horizontalSpace,
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
