import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/bottom_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class RangeOfPatternView extends StatelessWidget {
  const RangeOfPatternView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: AppText(
                  "Range Of Pattern",
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w500,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 280.h,
                child: GridView.builder(
                  itemCount: controller.rangeOfPatternList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    RangeOfPattern item = controller.rangeOfPatternList[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 120.h,
                          child: ClipOval(
                            child: Stack(
                              children: [
                                Image.network(
                                  item.image,
                                  height: 120.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withAlpha(
                                          (0.8 * 255).toInt(),
                                        ),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.all(20.h),
                                  child: AppText(
                                    item.name.toUpperCase(),
                                    textColor: AppColors.white,
                                    textSize: TextSize.medium_14,
                                    textAlign: TextAlign.center,
                                    multiLine: true,
                                    maxLine: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
