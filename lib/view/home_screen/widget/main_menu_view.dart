import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/top_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: Column(
            children: [
              /// main menu list
              SizedBox(
                height: 140.h,
                child: ListView.separated(
                  itemCount: controller.mainStickyMenuList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  itemBuilder: (context, index) {
                    MainStickyMenu item = controller.mainStickyMenuList[index];
                    return InkWell(
                      splashColor: Colors.blue.withAlpha((0.3 * 255).toInt()),
                      highlightColor: Colors.blue.withAlpha(
                        (0.1 * 255).toInt(),
                      ),
                      onTap: () {
                        print("InkWell tapped!");
                        controller.selectedSliderImagesList.value =
                            item.sliderImages ?? [];
                      },
                      child: Container(
                        height: 120.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(
                                25,
                              ), // subtle shadow
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 3), // position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: double.infinity,
                              child: Image.network(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 25.h,
                                width: double.infinity,
                                color: AppColors.white,
                                child: AppText(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  textSize: TextSize.medium_14,
                                  textWeight: TextWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.horizontalSpace;
                  },
                ),
              ),

              /// sub menu slider list
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                    items: List.generate(
                      controller.selectedSliderImagesList.length,
                      (index) {
                        return customItem(
                          data: controller.selectedSliderImagesList[index],
                          index: index,
                        );
                      },
                    ),
                    //carousel Slider flutter
                    options: CarouselOptions(
                      height: 200.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customItem({required MainStickyMenu data, required int index}) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(data.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45.h,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: AppColors.colorList[index % AppColors.colorList.length],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  data.title.toUpperCase(),
                  textAlign: TextAlign.start,
                  textSize: TextSize.small_12,
                  textWeight: TextWeight.w400,
                  multiLine: true,
                ),
                5.verticalSpace,
                AppText(
                  "+EXPLORE",
                  textAlign: TextAlign.start,
                  textSize: TextSize.extraSmall_10,
                  textWeight: TextWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
