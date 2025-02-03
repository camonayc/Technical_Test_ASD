import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: Column(
        children: [
          Text(
            'Nombre original',
            style: AppTextStyle.title.medium.copyWith(
              color: AppColors.steelBlue,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text(
            movie.originalTitle,
            style: AppTextStyle.body.large.copyWith(
              color: AppColors.mistBlue,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          Text(
            'Descripción',
            style: AppTextStyle.title.medium.copyWith(
              color: AppColors.steelBlue,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text(
            movie.overview,
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
