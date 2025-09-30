import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movie_response_model.dart';
import '../models/movie_details_model.dart';
import '../models/movie_cast_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/3/movie/popular')
  Future<MovieResponseModel> getPopularMovies(
    @Query('page') int page,
  );

  @GET('/3/movie/top_rated')
  Future<MovieResponseModel> getTopRatedMovies(
    @Query('page') int page,
  );

  @GET('/3/movie/upcoming')
  Future<MovieResponseModel> getUpcomingMovies(
    @Query('page') int page,
  );

  @GET('/3/movie/{movie_id}')
  Future<MovieDetailsModel> getMovieDetails(
    @Path('movie_id') int movieId,
  );

  @GET('/3/search/movie')
  Future<MovieResponseModel> searchMovies(
    @Query('query') String query,
    @Query('page') int page,
    @Query('include_adult') bool includeAdult,
  );

  @GET('/3/movie/{movie_id}/similar')
  Future<MovieResponseModel> getSimilarMovies(
    @Path('movie_id') int movieId,
    @Query('page') int page,
  );

  @GET('/3/movie/{movie_id}/credits')
  Future<MovieCastModel> getMovieCast(
    @Path('movie_id') int movieId,
  );
}