import '../entities/movie_response.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class GetTopRatedMoviesUseCase extends UseCase<MovieResponse, GetMoviesParams> {
  final MovieRepository repository;

  GetTopRatedMoviesUseCase(this.repository);

  @override
  Future<MovieResponse> call(GetMoviesParams params) async {
    return await repository.getTopRated(page: params.page);
  }
}