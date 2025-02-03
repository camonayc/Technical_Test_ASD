import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    this.focusNode,
  });

  final void Function(String) onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        style: AppTextStyle.body.large.copyWith(
          color: AppColors.mistBlue,
        ),
        focusNode: focusNode,
        decoration: InputDecoration(
            hintText: 'Buscar películas...',
            hintStyle: AppTextStyle.body.large.copyWith(
              color: AppColors.mistBlue,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 24.sp,
              color: AppColors.mistBlue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.mistBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.mistBlue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.mistBlue),
            )),
      ),
    );
  }
}
