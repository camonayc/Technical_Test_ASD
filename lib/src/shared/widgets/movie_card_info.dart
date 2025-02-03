import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/movie_card_description.dart';
import 'package:technical_test_asd/src/shared/widgets/rating_stars.dart';

class MovieCardInfo extends StatelessWidget {
  const MovieCardInfo({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nombre original',
          style: AppTextStyle.title.small.copyWith(
            color: AppColors.steelBlue,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.h),
        Text(
          movie.originalTitle,
          style: AppTextStyle.body.medium.copyWith(
            color: AppColors.mistBlue,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        Text(
          'Descripción',
          style: AppTextStyle.title.small.copyWith(
            color: AppColors.steelBlue,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.h),
        MovieCardDescription(description: movie.overview),
        SizedBox(height: 10.h),
        Text(
          'Calificación',
          style: AppTextStyle.title.small.copyWith(
            color: AppColors.steelBlue,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.h),
        RatingStars(rating: movie.voteAverage),
        SizedBox(height: 5.h),
        Text(
          '${movie.voteAverage.clamp(0, 5)}/5 - ${movie.voteCount} votos',
          style: AppTextStyle.body.medium.copyWith(
            color: AppColors.mistBlue,
          ),
        ),
      ],
    );
  }
}
