import 'package:flutter/material.dart';
import 'package:flutter_task_kombee_dhruvi_patel/core/constants/app_colors.dart';

/// To management App light and dark theme and typography --------- >>>
class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    /// Colors
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    disabledColor: AppColors.disableColor,
    hoverColor: AppColors.hoverColor,
    splashColor: AppColors.splashColor,

    /// Gesture
    splashFactory: InkRipple.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    highlightColor: Colors.transparent,
    indicatorColor: AppColors.primaryColor,

    /// Text
    textTheme: buildTextTheme(ThemeData.light().textTheme),
    primaryTextTheme: buildTextTheme(ThemeData.light().textTheme),

    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
    ),

    /// Note: uncomment if you using copyWith theme or it will throw error.
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      surface: AppColors.white,
    ),
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    //* Label
    labelSmall: TextStyle(
      fontSize: 11.0,
      fontFamily: "Roboto",
      color: base.labelSmall!.color,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: "Roboto",
      color: base.labelMedium!.color,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: "Roboto",
      color: base.labelLarge!.color,
    ),

    //* Body Text
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontFamily: "Roboto",
      color: base.bodySmall!.color,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontFamily: "Roboto",
      color: base.bodyMedium!.color,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontFamily: "Roboto",
      color: base.bodyLarge!.color,
    ),

    //* Title
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontFamily: "Roboto",
      color: base.titleSmall!.color,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: "Roboto",
      color: base.titleMedium!.color,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontFamily: "Roboto",
      color: base.titleLarge!.color,
    ),

    //* Headline
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontFamily: "Roboto",
      color: base.headlineSmall!.color,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontFamily: "Roboto",
      color: base.headlineMedium!.color,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontFamily: "Roboto",
      color: base.headlineLarge!.color,
    ),

    //* Display
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontFamily: "Roboto",
      color: base.displaySmall!.color,
    ),
    displayMedium: TextStyle(
      fontSize: 45.0,
      fontFamily: "Roboto",
      color: base.displayMedium!.color,
    ),
    displayLarge: TextStyle(
      fontSize: 57.0,
      fontFamily: "Roboto",
      color: base.displayLarge!.color,
    ),
  );
}
