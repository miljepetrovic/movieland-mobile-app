import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/movie_response.dart';
import 'movie_model.dart';

part 'movie_response_model.g.dart';

@JsonSerializable()
class MovieResponseModel {
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
  final List<MovieModel> results;

  const MovieResponseModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) => _$MovieResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseModelToJson(this);

  MovieResponse toEntity() {
    return MovieResponse(
      page: page,
      totalPages: totalPages,
      totalResults: totalResults,
      movies: results.map((movie) => movie.toEntity()).toList(),
    );
  }
}