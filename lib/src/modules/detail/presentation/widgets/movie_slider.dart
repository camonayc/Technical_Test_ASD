import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/utils/types/image_width.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final String posterUrl =
        '${Environment.config.imageBaseUrl}/${PosterSizes.w780.value}/${movie.posterPath}';
    final String backdropUrl =
        '${Environment.config.imageBaseUrl}/${BackdropSizes.w780.value}/${movie.backdropPath}';

    return Container(
      height: 500.h,
      color: AppColors.carbonBlue.withOpacity(0.5),
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildImage(context, posterUrl),
          if (movie.backdropPath.isNotEmpty) _buildImage(context, backdropUrl),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: url,
        height: 500.h,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
        placeholder: (context, url) => ColoredBox(
          color: AppColors.carbonBlue.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.mistBlue,
              strokeWidth: 2,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
