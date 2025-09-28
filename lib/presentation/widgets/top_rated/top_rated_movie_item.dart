import 'package:flutter/material.dart';
import '../common/movie_item.dart';
import 'top_rated_bottom_row.dart';

/// Top rated movie item with year and rating
class TopRatedMovieItem extends StatelessWidget {
  final String title;
  final String description;
  final String year;
  final double rating;
  final String? posterUrl;

  const TopRatedMovieItem({
    super.key,
    required this.title,
    required this.description,
    required this.year,
    required this.rating,
    this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MovieItem(
      title: title,
      description: description,
      posterUrl: posterUrl,
      bottomWidget: TopRatedBottomRow(
        year: year,
        rating: rating,
      ),
    );
  }
}