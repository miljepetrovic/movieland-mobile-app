import 'package:flutter/material.dart';
import '../../../core/constants/design_tokens.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extensions.dart';

/// Base widget that displays a movie item in a list
/// Shows poster image, title, description, and optional bottom widget
class MovieItem extends StatelessWidget {
  final String title;
  final String description;
  final String? posterUrl;
  final Widget? bottomWidget;

  const MovieItem({
    super.key,
    required this.title,
    required this.description,
    this.posterUrl,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DesignTokens.spaceMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviePoster(posterUrl: posterUrl),
          SizedBox(width: DesignTokens.spaceMedium),
          Expanded(
            child: _MovieInfo(
              title: title,
              description: description,
              bottomWidget: bottomWidget,
            ),
          ),
        ],
      ),
    );
  }
}

/// Private widget that displays movie information (title, description, bottom widget)
class _MovieInfo extends StatelessWidget {
  final String title;
  final String description;
  final Widget? bottomWidget;

  const _MovieInfo({
    required this.title,
    required this.description,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MovieTitle(title: title),
          SizedBox(height: DesignTokens.spaceExtraSmall),
          Expanded(
            child: _MovieDescription(description: description),
          ),
          if (bottomWidget != null) ...[
            SizedBox(height: DesignTokens.spaceExtraSmall),
            bottomWidget!,
          ],
        ],
      ),
    );
  }
}

/// Private widget that displays the movie title
class _MovieTitle extends StatelessWidget {
  final String title;

  const _MovieTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Private widget that displays the movie description
class _MovieDescription extends StatelessWidget {
  final String description;

  const _MovieDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.bodyMedium?.copyWith(
        color: AppColors.grey,
        height: 1.3,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Private widget for movie poster
class _MoviePoster extends StatelessWidget {
  final String? posterUrl;

  const _MoviePoster({required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSmall),
        border: Border.all(
          color: AppColors.grey.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child:
          posterUrl != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(DesignTokens.radiusSmall),
                child: Image.network(
                  posterUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.movie,
                      size: DesignTokens.iconLarge,
                      color: AppColors.grey,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                      ),
                    );
                  },
                ),
              )
              : Icon(
                Icons.movie,
                size: DesignTokens.iconLarge,
                color: AppColors.grey,
              ),
    );
  }
}
