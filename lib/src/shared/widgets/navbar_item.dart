import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 5.h,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.mistBlue : AppColors.blueberryBlue,
            size: 40.w,
          ),
          if (isSelected)
            Container(
              width: 20.w,
              decoration: BoxDecoration(
                color: AppColors.mistBlue,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.mistBlue,
                    width: 2.w,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
