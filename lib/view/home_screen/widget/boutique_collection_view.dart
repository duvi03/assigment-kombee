import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/middel_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class BoutiqueCollectionView extends StatelessWidget {
  const BoutiqueCollectionView({super.key});

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
                  "Boutique Collection",
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w500,
                ),
              ),
              10.verticalSpace,
              SizedBox(
                height: 500.h,
                width: MediaQuery.of(Get.context!).size.width,
                child: PageView.builder(
                  itemCount: controller.boutiqueCollectionList.length,
                  pageSnapping: true,
                  controller: controller.boutiquePageController,
                  onPageChanged: (int index) {
                    controller.activePage.value = index;
                  },
                  itemBuilder: (context, pagePosition) {
                    BoutiqueCollection item =
                        controller.boutiqueCollectionList[pagePosition];
                    return Stack(
                      children: [
                        Image.network(
                          item.bannerImage,
                          height: 500.h,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  item.name.toUpperCase(),
                                  textSize: TextSize.headline_24,
                                  textColor: AppColors.white,
                                  multiLine: true,
                                ),
                                15.verticalSpace,
                                AppText(
                                  "+EXPLORE",
                                  textAlign: TextAlign.start,
                                  textSize: TextSize.extraSmall_10,
                                  textWeight: TextWeight.w400,
                                  textColor: AppColors.white,
                                ),
                                10.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              4.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(
                  controller.boutiqueCollectionList.length,
                  controller.activePage.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: currentIndex == index ? 10 : 6,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black87 : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }
}
