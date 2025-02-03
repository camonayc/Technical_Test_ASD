import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/cast.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.castImageUrl,
    required this.cast,
  });

  final String castImageUrl;
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      child: Column(
        spacing: 10.h,
        children: [
          Container(
            height: 150.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.blueberryBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.carbonBlue,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                width: 100.w,
                imageUrl: castImageUrl,
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
                  color: AppColors.mistBlue,
                ),
              ),
            ),
          ),
          Text(
            cast.name,
            style: AppTextStyle.title.small.copyWith(
              color: AppColors.steelBlue,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            cast.character,
            style: AppTextStyle.body.medium.copyWith(
              color: AppColors.mistBlue,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
