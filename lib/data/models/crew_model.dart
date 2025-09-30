import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cast_member.dart';

part 'crew_model.g.dart';

@JsonSerializable()
class CrewModel {
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
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String department;
  final String job;

  const CrewModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) => _$CrewModelFromJson(json);
  Map<String, dynamic> toJson() => _$CrewModelToJson(this);

  CrewMember toEntity() {
    return CrewMember(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      creditId: creditId,
      department: department,
      job: job,
    );
  }
}