import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../../data/api/api_service.dart';
import '../../data/repositories/movie_api_repository.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/use_cases/get_popular_movies_use_case.dart';
import '../../domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../domain/use_cases/get_upcoming_movies_use_case.dart';
import '../../domain/use_cases/get_movie_details_use_case.dart';
import '../../domain/use_cases/search_movies_use_case.dart';
import '../../domain/use_cases/get_similar_movies_use_case.dart';
import '../../domain/use_cases/get_movie_cast_use_case.dart';
import '../../presentation/bloc/popular_movies/popular_movies_bloc.dart';
import '../../presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../../presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Network
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  // API Service
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieApiRepository(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => SearchMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieCastUseCase(sl()));

  // BLoCs
  sl.registerFactory(() => PopularMoviesBloc(getPopularMoviesUseCase: sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(getTopRatedMoviesUseCase: sl()));
  sl.registerFactory(() => UpcomingMoviesBloc(getUpcomingMoviesUseCase: sl()));
}
