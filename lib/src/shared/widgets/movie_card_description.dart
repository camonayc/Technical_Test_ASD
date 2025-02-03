import 'package:flutter/material.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';

class MovieCardDescription extends StatelessWidget {
  const MovieCardDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    const int maxLength = 100;
    final descriptionText = description;

    String displayText = descriptionText;

    if (descriptionText.length > maxLength) {
      displayText = '${descriptionText.substring(0, maxLength)}...';
    }

    return Text(
      description.isNotEmpty ? displayText : 'Sin descripción. \n\n\n\n',
      style: AppTextStyle.body.medium.copyWith(
        color: AppColors.mistBlue,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
