import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';

class WrapBanner extends StatelessWidget {
  const WrapBanner({
    super.key,
    required this.child,
    this.label = '',
    this.color,
    this.location = BannerLocation.topStart,
    this.visible = true,
  });

  final Widget? child;
  final String? label;
  final Color? color;
  final BannerLocation? location;
  final bool? visible;
  @override
  Widget build(BuildContext context) {
    if (visible != null && visible!) {
      return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Banner(
          location: location ?? BannerLocation.topStart,
          message: label ?? '',
          color: color ?? (label == 'PROD' ? Colors.blue : Colors.green),
          textStyle: TextStyle(
            fontFamily: AppTextStyle.body.medium.fontFamily,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
          ),
          child: child,
        ),
      );
    } else {
      return child ?? const SizedBox();
    }
  }
}
