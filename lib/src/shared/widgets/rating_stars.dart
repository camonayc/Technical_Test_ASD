import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    final filledStars = rating.clamp(0, 5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        if (index < filledStars) {
          return Icon(
            Icons.star,
            color: Colors.amber,
            size: 20.sp,
          );
        } else if (index < filledStars + 1 &&
            filledStars != filledStars.toInt()) {
          return Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 20.sp,
          );
        } else {
          return Icon(
            Icons.star_border,
            color: Colors.amber,
            size: 20.sp,
          );
        }
      }),
    );
  }
}
