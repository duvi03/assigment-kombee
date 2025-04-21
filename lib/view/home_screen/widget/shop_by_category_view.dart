import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/utils/utils.dart';
import 'package:flutter_task_kombee_dhruvi_patel/data/model/middel_model.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_controller.dart';
import 'package:get/get.dart';

class ShopByCategoryView extends StatelessWidget {
  const ShopByCategoryView({super.key});

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
                  "Shop By Category",
                  textSize: TextSize.title_18,
                  textWeight: TextWeight.w500,
                ),
              ),

              SizedBox(
                height: 400.h,
                child: GridView.builder(
                  itemCount: controller.shopByCategoryList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    ShopBy item = controller.shopByCategoryList[index];
                    return Container(
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Utils.fromHex(item.tintColor),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item.image,
                            height: 130.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText(
                              item.name.toUpperCase(),
                              textSize: TextSize.small_12,
                              textWeight: TextWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: AppText(
                              "+EXPLORE",
                              textSize: TextSize.extraSmall_10,
                              textWeight: TextWeight.w400,
                              textColor: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
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
