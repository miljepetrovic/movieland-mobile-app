// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCastModel _$MovieCastModelFromJson(Map<String, dynamic> json) =>
    MovieCastModel(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCastModelToJson(MovieCastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
