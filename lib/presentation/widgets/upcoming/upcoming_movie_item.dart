import 'package:flutter/material.dart';
import '../common/movie_item.dart';
import 'upcoming_bottom_row.dart';

/// Upcoming movie item with release date
class UpcomingMovieItem extends StatelessWidget {
  final String title;
  final String description;
  final String releaseDate;
  final String? posterUrl;

  const UpcomingMovieItem({
    super.key,
    required this.title,
    required this.description,
    required this.releaseDate,
    this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MovieItem(
      title: title,
      description: description,
      posterUrl: posterUrl,
      bottomWidget: UpcomingBottomRow(releaseDate: releaseDate),
    );
  }
}