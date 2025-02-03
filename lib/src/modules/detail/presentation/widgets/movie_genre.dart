import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/genres.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    super.key,
    this.genres = const [],
  });

  final List<Genres> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50.w,
      ),
      child: Column(
        children: [
          Text(
            'Generos',
            style: AppTextStyle.title.medium.copyWith(
              color: AppColors.steelBlue,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text(
            genres.map((genre) => genre.name).join(', '),
            style: AppTextStyle.body.large.copyWith(
              color: AppColors.mistBlue,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
