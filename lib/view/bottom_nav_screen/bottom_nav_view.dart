import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/bottom_nav_screen/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.navItems.length, (index) {
              bool isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        controller.navItems[index]['icon'],
                        color: isSelected ? AppColors.green : AppColors.grey,
                        size: 24.h,
                      ),
                      SizedBox(height: 4),
                      AppText(
                        controller.navItems[index]['label'],
                        textColor:
                            isSelected ? AppColors.green : AppColors.grey,
                        textWeight:
                            isSelected ? TextWeight.w800 : TextWeight.w400,
                        textSize: TextSize.small_12,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
