// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      popularity: (json['popularity'] as num).toDouble(),
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      adult: json['adult'] as bool,
      video: json['video'] as bool,
      belongsToCollection: json['belongs_to_collection'],
      budget: (json['budget'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map(
              (e) => ProductionCompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map(
              (e) => ProductionCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: (json['revenue'] as num).toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'adult': instance.adult,
      'video': instance.video,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
    };
