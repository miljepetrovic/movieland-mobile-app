import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final DateTime releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final String originalTitle;
  final String originalLanguage;
  final List<int> genreIds;
  final bool adult;
  final bool video;

  const Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.originalTitle,
    required this.originalLanguage,
    required this.genreIds,
    required this.adult,
    required this.video,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        overview,
        releaseDate,
        voteAverage,
        voteCount,
        popularity,
        originalTitle,
        originalLanguage,
        genreIds,
        adult,
        video,
      ];
}