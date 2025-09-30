import '../entities/cast_member.dart';
import '../repositories/movie_repository.dart';
import 'base/use_case.dart';
import 'params/movie_params.dart';

class GetMovieCastUseCase extends UseCase<MovieCast, GetMovieCastParams> {
  final MovieRepository repository;

  GetMovieCastUseCase(this.repository);

  @override
  Future<MovieCast> call(GetMovieCastParams params) async {
    return await repository.getCast(params.movieId);
  }
}