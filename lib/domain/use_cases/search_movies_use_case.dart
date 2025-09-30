import '../entities/movie_response.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class SearchMoviesUseCase extends UseCase<MovieResponse, SearchMoviesParams> {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  @override
  Future<MovieResponse> call(SearchMoviesParams params) async {
    return await repository.search(params.query, page: params.page);
  }
}
