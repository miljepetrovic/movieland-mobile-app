import '../entities/movie_response.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class GetSimilarMoviesUseCase extends UseCase<MovieResponse, GetSimilarMoviesParams> {
  final MovieRepository repository;

  GetSimilarMoviesUseCase(this.repository);

  @override
  Future<MovieResponse> call(GetSimilarMoviesParams params) async {
    return await repository.getSimilar(params.movieId, page: params.page);
  }
}