import 'package:flutter/material.dart';
import '../../../domain/entities/movie.dart';
import '../../../core/constants/api_constants.dart';
import '../common/movie_item.dart';
import 'popular_bottom_row.dart';

/// Popular movie item with year and vote count
class PopularMovieItem extends StatelessWidget {
  final Movie movie;

  const PopularMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return MovieItem(
      title: movie.title,
      description: movie.overview,
      posterUrl: movie.posterPath != null
          ? '${ApiConstants.imageBaseUrl}${movie.posterPath}'
          : null,
      bottomWidget: PopularBottomRow(
        year: movie.releaseDate.year.toString(),
        voteCount: movie.voteCount,
      ),
    );
  }
}