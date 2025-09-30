import '../../domain/entities/movie_response.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/cast_member.dart';
import '../../domain/repositories/movie_repository.dart';
import '../api/api_service.dart';

class MovieApiRepository implements MovieRepository {
  final ApiService _apiService;

  const MovieApiRepository(this._apiService);

  @override
  Future<MovieResponse> getPopular({int page = 1}) async {
    try {
      final response = await _apiService.getPopularMovies(page);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch popular movies: $e');
    }
  }

  @override
  Future<MovieResponse> getTopRated({int page = 1}) async {
    try {
      final response = await _apiService.getTopRatedMovies(page);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch top rated movies: $e');
    }
  }

  @override
  Future<MovieResponse> getUpcoming({int page = 1}) async {
    try {
      final response = await _apiService.getUpcomingMovies(page);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch upcoming movies: $e');
    }
  }

  @override
  Future<MovieDetails> getDetails(int id) async {
    try {
      final response = await _apiService.getMovieDetails(id);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch movie details: $e');
    }
  }

  @override
  Future<MovieResponse> search(String query, {int page = 1}) async {
    try {
      final response = await _apiService.searchMovies(query, page, false);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  @override
  Future<MovieResponse> getSimilar(int id, {int page = 1}) async {
    try {
      final response = await _apiService.getSimilarMovies(id, page);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch similar movies: $e');
    }
  }

  @override
  Future<MovieCast> getCast(int id) async {
    try {
      final response = await _apiService.getMovieCast(id);
      return response.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch movie cast: $e');
    }
  }
}