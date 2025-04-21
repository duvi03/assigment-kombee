import 'package:flutter/material.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_text.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/category_screen/category_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_view.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = RxInt(0); // Default to 'Bag'

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final RxList<Map<String, dynamic>> navItems =
      [
        {"icon": Icons.home, "label": "Home"},
        {"icon": Icons.category_outlined, "label": "Category"},
        {"icon": Icons.shopping_bag, "label": "Curate"},
        {"icon": Icons.favorite_border, "label": "Sale"},
        {"icon": Icons.more_horiz, "label": "More"},
      ].obs;

  final List<Widget> pages = [
    HomeView(),
    CategoryView(),
    Center(child: AppText('Curate Page')),
    Center(child: AppText('Sale Page')),
    Center(child: AppText('More Page')),
  ];
}
