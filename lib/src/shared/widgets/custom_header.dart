import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/shared/widgets/search_field.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.onSearch,
    this.opacity = 1.0,
    this.focusNode,
  });

  final String title;
  final void Function(String) onSearch;
  final double opacity;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160.h,
      toolbarHeight: 100.h,
      pinned: true,
      floating: false,
      backgroundColor: AppColors.midnightBlue,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.carbonBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              boxShadow: AppColors.shadows,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: opacity,
                  child: Text(
                    title,
                    style: AppTextStyle.display.large.copyWith(
                      color: AppColors.mistBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                  ),
                  child: SearchField(
                    onChanged: onSearch,
                    focusNode: focusNode,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
