import 'package:flutter/material.dart';
import '../common/movie_item.dart';
import 'popular_bottom_row.dart';

/// Popular movie item with year and vote count
class PopularMovieItem extends StatelessWidget {
  final String title;
  final String description;
  final String year;
  final int voteCount;
  final String? posterUrl;

  const PopularMovieItem({
    super.key,
    required this.title,
    required this.description,
    required this.year,
    required this.voteCount,
    this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MovieItem(
      title: title,
      description: description,
      posterUrl: posterUrl,
      bottomWidget: PopularBottomRow(
        year: year,
        voteCount: voteCount,
      ),
    );
  }
}