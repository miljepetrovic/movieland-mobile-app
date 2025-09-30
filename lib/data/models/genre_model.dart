import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  const GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  Genre toEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }
}