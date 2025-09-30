import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/spoken_language.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel {
  @JsonKey(name: 'english_name')
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String name;

  const SpokenLanguageModel({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) => _$SpokenLanguageModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);

  SpokenLanguage toEntity() {
    return SpokenLanguage(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }
}