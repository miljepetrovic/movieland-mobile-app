import '../entities/movie_response.dart';
import '../entities/movie_details.dart';
import '../entities/cast_member.dart';

abstract class MovieRepository {
  Future<MovieResponse> getPopular({int page = 1});
  Future<MovieResponse> getTopRated({int page = 1});
  Future<MovieResponse> getUpcoming({int page = 1});
  Future<MovieDetails> getDetails(int id);
  Future<MovieResponse> search(String query, {int page = 1});
  Future<MovieResponse> getSimilar(int id, {int page = 1});
  Future<MovieCast> getCast(int id);
}
