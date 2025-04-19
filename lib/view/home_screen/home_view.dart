import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_assets.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.headerImage, height: 180.h),
        actions: [
          Icon(Icons.search, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
          Icon(Icons.shopping_bag_outlined, color: AppColors.grey, size: 24.h),
          10.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// category list
            SizedBox(
              height: 140.h,
              child: ListView.separated(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 120.h,
                    width: 180.w,
                    child: Stack(
                      children: [
                        Container(height: 100.h, color: AppColors.yellow),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 25.h,
                            width: double.infinity,
                            color: Colors.green,
                            child: AppText(
                              "Category $index",
                              textAlign: TextAlign.center,
                              textSize: TextSize.medium_14,
                              textWeight: TextWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 10.horizontalSpace;
                },
              ),
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                CarouselSlider(
                  items: [
                    customItem(imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rvSWtRd_oPRTwDoTCmkP5gAAAA%26pid%3DApi&f=1&ipt=4eff9a5d7d22249208e9472e985283aee53c7c785e9265810c51f0f39de585bc&ipo=images"),
                    customItem(imageUrl: "http://allpicts.in/wp-content/uploads/2018/03/Natural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg"),
                    customItem(imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OjNHJL6A-Lzw_jLJfFgtMwHaEK%26pid%3DApi&f=1&ipt=9f19fe8349e515790867030de18da3ba6f4cae0548d5195b66004453fb7916d0&ipo=images"),
                    customItem(imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.bircyBDvJOcKd3mkR6ramwHaEK%26pid%3DApi&f=1&ipt=5909f3cdfdc42fb7effd2baabc4312074c2866f899860a96cf501dc9d1f51cf4&ipo=images"),
                  ],
                  //Slider Container properties
                  //carousel Slider flutter
                  options: CarouselOptions(
                    height: 240.0,
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
      ),
    );
  }

  Widget customItem({required String imageUrl}){
    return  //1st Image of Slider
      Container(
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
  }
}
