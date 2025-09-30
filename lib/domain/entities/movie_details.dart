import 'package:equatable/equatable.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

class MovieDetails extends Equatable {
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
  final bool adult;
  final bool video;
  final Object? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final String? imdbId;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;

  const MovieDetails({
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
        adult,
        video,
        belongsToCollection,
        budget,
        genres,
        homepage,
        imdbId,
        productionCompanies,
        productionCountries,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
      ];
}