import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/movie_details.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
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
  final bool adult;
  final bool video;
  @JsonKey(name: 'belongs_to_collection')
  final Object? belongsToCollection;
  final int budget;
  final List<GenreModel> genres;
  final String? homepage;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanyModel> productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountryModel> productionCountries;
  final int revenue;
  final int? runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageModel> spokenLanguages;
  final String status;
  final String? tagline;

  const MovieDetailsModel({
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
    required this.adult,
    required this.video,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    this.imdbId,
    required this.productionCompanies,
    required this.productionCountries,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => _$MovieDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

  MovieDetails toEntity() {
    return MovieDetails(
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
      adult: adult,
      video: video,
      belongsToCollection: belongsToCollection,
      budget: budget,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      imdbId: imdbId,
      productionCompanies: productionCompanies.map((company) => company.toEntity()).toList(),
      productionCountries: productionCountries.map((country) => country.toEntity()).toList(),
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages.map((language) => language.toEntity()).toList(),
      status: status,
      tagline: tagline,
    );
  }
}