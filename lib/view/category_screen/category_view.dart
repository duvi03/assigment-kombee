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
      body: GetX(
        init: CategoryController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              Category item = controller.categoryList[index];

              return Container(
                height: 100.h,
                margin: EdgeInsets.symmetric(vertical: 4.h),
                color: AppColors.yellow,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.sp),
                                bottomRight: Radius.circular(50.sp),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                item.categoryName ?? "",
                                textSize: TextSize.large_16,
                                textWeight: TextWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(width: 120),
                        // Image.network(
                        //   item.imageUrl,
                        //   width: 120,
                        //   fit: BoxFit.cover,
                        // ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
