import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';
import 'movie_rating.dart';

/// Bottom row for top rated movies (year + rating)
class TopRatedBottomRow extends StatelessWidget {
  final String year;
  final double rating;

  const TopRatedBottomRow({
    super.key,
    required this.year,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          year,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.greyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        MovieRating(rating: rating),
      ],
    );
  }
}