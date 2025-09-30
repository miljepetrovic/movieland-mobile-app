import '../entities/movie_details.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class GetMovieDetailsUseCase extends UseCase<MovieDetails, GetMovieDetailsParams> {
  final MovieRepository repository;

  GetMovieDetailsUseCase(this.repository);

  @override
  Future<MovieDetails> call(GetMovieDetailsParams params) async {
    return await repository.getDetails(params.movieId);
  }
}