import 'package:flutter/material.dart';
import '../../../core/constants/design_tokens.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';

/// Small stateless widget for vote count with people icon
class MovieVoteCount extends StatelessWidget {
  final int voteCount;

  const MovieVoteCount({
    super.key,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.people,
          size: DesignTokens.iconSmall,
          color: AppColors.grey,
        ),
        SizedBox(width: DesignTokens.spaceExtraSmall),
        Text(
          voteCount.toString(),
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.greyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}