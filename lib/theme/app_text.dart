import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';

enum TextSize {
  extraSmall_10,
  small_12,
  medium_14,
  large_16,
  title_18,
  headline_24,
}

enum TextWeight { w400, w500, w600, w700, w800 }

class AppText extends StatelessWidget {
  final String text;
  final TextSize? textSize;
  final TextWeight? textWeight;
  final Color? textColor;
  final bool? multiLine;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const AppText(
    this.text, {
    super.key,
    this.textSize = TextSize.small_12,
    this.textWeight = TextWeight.w400,
    this.textColor = AppColors.primaryTextColor,
    this.multiLine = false,
    this.textAlign = TextAlign.left,
    this.textDecoration,
    this.maxLine,
  });

  const AppText.multiLine(
    this.text, {
    super.key,
    this.textSize = TextSize.small_12,
    this.textWeight = TextWeight.w400,
    this.textColor = AppColors.primaryTextColor,
    this.textAlign = TextAlign.left,
    this.textDecoration,
    this.maxLine,
  }) : multiLine = true;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiLine! ? maxLine ?? null : 1,
      textAlign: textAlign,
      overflow: multiLine! ? TextOverflow.visible : TextOverflow.ellipsis,
      style: textStyle!.copyWith(
        color: textColor,
        fontWeight: fontWeight,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }

  FontWeight? get fontWeight {
    switch (textWeight) {
      case TextWeight.w400:
        return FontWeight.w400;
      case TextWeight.w500:
        return FontWeight.w500;
      case TextWeight.w600:
        return FontWeight.w600;
      case TextWeight.w700:
        return FontWeight.w700;
      case TextWeight.w800:
        return FontWeight.w800;
      default:
        return FontWeight.w400;
    }
  }

  TextStyle? get textStyle {
    switch (textSize) {
      case TextSize.extraSmall_10:
        return Theme.of(
          Get.context!,
        ).textTheme.bodySmall!.copyWith(fontSize: 10.sp);
      case TextSize.small_12:
        return Theme.of(
          Get.context!,
        ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp);
      case TextSize.medium_14:
        return Theme.of(
          Get.context!,
        ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp);
      case TextSize.large_16:
        return Theme.of(
          Get.context!,
        ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp);
      case TextSize.title_18:
        return Theme.of(
          Get.context!,
        ).textTheme.titleMedium!.copyWith(fontSize: 18.sp);
      case TextSize.headline_24:
        return Theme.of(
          Get.context!,
        ).textTheme.headlineSmall!.copyWith(fontSize: 24.sp);
      default:
        return Theme.of(
          Get.context!,
        ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp);
    }
  }
}
