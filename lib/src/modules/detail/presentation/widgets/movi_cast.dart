import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/core/utils/types/image_width.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/cast.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/cast_card.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({
    super.key,
    this.castList = const [],
  });

  final List<Cast> castList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Casting',
          style: AppTextStyle.title.medium.copyWith(
            color: AppColors.steelBlue,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              castList.length,
              (i) {
                final Cast cast = castList[i];
                final String castImageUrl =
                    '${Environment.config.imageBaseUrl}/${ProfileSizes.w500.value}/${cast.profilePath}';
                return CastCard(
                  castImageUrl: castImageUrl,
                  cast: cast,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
