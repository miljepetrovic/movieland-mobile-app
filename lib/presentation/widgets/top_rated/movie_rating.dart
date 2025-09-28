import 'package:flutter/material.dart';
import '../../../core/constants/design_tokens.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';

/// Small stateless widget for rating with star icon
class MovieRating extends StatelessWidget {
  final double rating;

  const MovieRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          size: DesignTokens.iconSmall,
          color: AppColors.grey,
        ),
        SizedBox(width: DesignTokens.spaceExtraSmall),
        Text(
          rating.toString(),
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.greyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}