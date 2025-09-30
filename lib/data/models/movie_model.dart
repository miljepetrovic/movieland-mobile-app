import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final String title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final double popularity;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  final bool adult;
  final bool video;

  const MovieModel({
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

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      overview: overview,
      releaseDate: DateTime.tryParse(releaseDate) ?? DateTime.now(),
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
      originalTitle: originalTitle,
      originalLanguage: originalLanguage,
      genreIds: genreIds,
      adult: adult,
      video: video,
    );
  }
}