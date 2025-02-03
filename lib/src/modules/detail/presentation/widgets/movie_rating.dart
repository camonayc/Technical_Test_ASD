import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/rating_stars.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Calificación',
              style: AppTextStyle.title.medium.copyWith(
                color: AppColors.steelBlue,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            RatingStars(rating: movie.voteAverage),
            SizedBox(height: 5.h),
            Text(
              '${movie.voteAverage.clamp(0, 5)}/5 ',
              style: AppTextStyle.body.large.copyWith(
                color: AppColors.mistBlue,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Votos',
              style: AppTextStyle.title.medium.copyWith(
                color: AppColors.steelBlue,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              '${movie.voteCount}',
              style: AppTextStyle.body.large.copyWith(
                color: AppColors.mistBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
