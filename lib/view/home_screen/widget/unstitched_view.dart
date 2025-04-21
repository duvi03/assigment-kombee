import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/middel_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class UnstitchedView extends StatelessWidget {
  const UnstitchedView({super.key});

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
                  "Unstitched",
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w500,
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    height: 380,
                    viewportFraction: 0.5,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  ),
                  items: List.generate(controller.unstitchedList.length, (
                    index,
                  ) {
                    return customItem(data: controller.unstitchedList[index]);
                  }),
                ),
              ),

              14.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Widget customItem({required Unstitched data}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0), // optional
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(data.image, fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.8 * 255).toInt()),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Center(
                child: AppText(
                  data.name.toUpperCase(),
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w800,
                  textColor: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
