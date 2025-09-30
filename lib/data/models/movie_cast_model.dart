import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cast_member.dart';
import 'cast_model.dart';
import 'crew_model.dart';

part 'movie_cast_model.g.dart';

@JsonSerializable()
class MovieCastModel {
  final int id;
  final List<CastModel> cast;
  final List<CrewModel> crew;

  const MovieCastModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => _$MovieCastModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCastModelToJson(this);

  MovieCast toEntity() {
    return MovieCast(
      id: id,
      cast: cast.map((castMember) => castMember.toEntity()).toList(),
      crew: crew.map((crewMember) => crewMember.toEntity()).toList(),
    );
  }
}