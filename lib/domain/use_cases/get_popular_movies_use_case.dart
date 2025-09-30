import '../entities/movie_response.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class GetPopularMoviesUseCase extends UseCase<MovieResponse, GetMoviesParams> {
  final MovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  @override
  Future<MovieResponse> call(GetMoviesParams params) async {
    return await repository.getPopular(page: params.page);
  }
}