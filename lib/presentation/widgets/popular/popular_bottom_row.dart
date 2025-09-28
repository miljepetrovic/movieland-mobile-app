import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';
import 'movie_vote_count.dart';

/// Bottom row for popular movies (year + vote count)
class PopularBottomRow extends StatelessWidget {
  final String year;
  final int voteCount;

  const PopularBottomRow({
    super.key,
    required this.year,
    required this.voteCount,
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
        MovieVoteCount(voteCount: voteCount),
      ],
    );
  }
}
