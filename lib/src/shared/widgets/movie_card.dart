import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/core/utils/types/image_width.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/movie_card_info.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
    this.isFavorite = false,
    this.onDelete,
  });

  final MovieModel movie;
  final void Function() onTap;
  final bool isFavorite;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final String posterUrl =
        '${Environment.config.imageBaseUrl}/${PosterSizes.w342.value}/${movie.posterPath}';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      splashColor: AppColors.blueberryBlue.withOpacity(0.25),
      highlightColor: AppColors.blueberryBlue.withOpacity(0.25),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppColors.blueberryBlue,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: AppTextStyle.display.small.copyWith(
                      color: AppColors.mistBlue,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isFavorite)
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.favorite,
                      size: 35.sp,
                      color: isFavorite ? Colors.red : AppColors.steelBlue,
                    ),
                  )
              ],
            ),
            Row(
              spacing: 20.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: posterUrl,
                    height: 240.h,
                    width: 150.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 240.h,
                      width: 150.w,
                      color: AppColors.blueberryBlue.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mistBlue,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, size: 50),
                  ),
                ),
                Expanded(
                  child: MovieCardInfo(movie: movie),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
