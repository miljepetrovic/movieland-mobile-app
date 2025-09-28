import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';

/// Bottom row for upcoming movies (release date only)
class UpcomingBottomRow extends StatelessWidget {
  final String releaseDate;

  const UpcomingBottomRow({
    super.key,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      releaseDate,
      style: context.textTheme.bodySmall?.copyWith(
        color: AppColors.greyDark,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}