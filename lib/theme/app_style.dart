import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultPadding = 14.h;
double defaultRadius = 10.r;

double defaultTopPadding = ScreenUtil().statusBarHeight + defaultPadding;
double defaultBottomPadding =
    ScreenUtil().bottomBarHeight == 0.0
        ? defaultPadding
        : ScreenUtil().bottomBarHeight + defaultPadding;
