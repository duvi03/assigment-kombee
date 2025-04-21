import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/bottom_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class DesignAsOccasionView extends StatelessWidget {
  const DesignAsOccasionView({super.key});

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
                  "Design As Per Occasion",
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w500,
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.designOccasionList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 2 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  DesignOccasion item = controller.designOccasionList[index];
                  return CollectionCard(data: item);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CollectionCard extends StatelessWidget {
  final DesignOccasion data;
  const CollectionCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(60),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              data.image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // Bottom overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 35.h,
              color: AppColors.lightOverLay,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data.name,
                    textSize: TextSize.small_12,
                    textWeight: TextWeight.w600,
                    multiLine: true,
                    maxLine: 1,
                  ),
                  FittedBox(
                    child: AppText(
                      "COLLECTION",
                      textSize: TextSize.extraSmall_10,
                      textWeight: TextWeight.w400,
                      textColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
