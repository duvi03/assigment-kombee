import 'package:flutter_task_kombee_dhruvi_patel/view/bottom_nav_screen/bottom_nav_bindings.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/bottom_nav_screen/bottom_nav_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_bindings.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/home_screen/home_view.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/splash_screen/splash_bindings.dart';
import 'package:flutter_task_kombee_dhruvi_patel/view/splash_screen/splash_view.dart';
import 'package:get/get.dart';

import 'routes_name.dart';

/// Function to define a GetPage route
GetPage getPage({
  String? name,
  GetPageBuilder? page,
  Bindings? binding,
  List<GetPage<dynamic>>? children,
}) {
  return GetPage(
    name: name!,
    page: page!,
    binding: binding,
    children: children ?? [],
  );
}

/// List of all routes
List<GetPage> pages = [
  getPage(
    name: RoutesName.splashView,
    page: () => const SplashView(),
    binding: SplashBindings(),
  ),
  getPage(
    name: RoutesName.bottomNavView,
    page: () => const BottomNavView(),
    binding: BottomNavBindings(),
  ),
  getPage(
    name: RoutesName.homeView,
    page: () => const HomeView(),
    binding: HomeBindings(),
  ),
];
