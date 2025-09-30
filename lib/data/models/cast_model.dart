import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cast_member.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel {
  final bool adult;
  final int gender;
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int castId;
  final String character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final int order;

  const CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);
  Map<String, dynamic> toJson() => _$CastModelToJson(this);

  CastMember toEntity() {
    return CastMember(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      castId: castId,
      character: character,
      creditId: creditId,
      order: order,
    );
  }
}