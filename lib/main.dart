import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_strings.dart';
import 'package:flutter_task_kombee_dhruvi_patel/routes/routes.dart';
import 'package:flutter_task_kombee_dhruvi_patel/routes/routes_name.dart';
import 'package:flutter_task_kombee_dhruvi_patel/theme/app_theme.dart';
import 'package:get/get.dart';

import 'core/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.darkStatusBar();
  Utils.screenPortrait();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: RoutesName.splashView,
        getPages: pages,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaler.clamp(
            minScaleFactor: 1.0,
            maxScaleFactor: 1.14,
          );
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: scale),
            child: child!,
          );
        },
      ),
    );
  }
}
