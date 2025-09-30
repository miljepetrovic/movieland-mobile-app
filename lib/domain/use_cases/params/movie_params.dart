import '../base/use_case.dart';

class GetMoviesParams extends Params {
  final int page;

  const GetMoviesParams({this.page = 1});

  @override
  List<Object> get props => [page];
}

class GetMovieDetailsParams extends Params {
  final int movieId;

  const GetMovieDetailsParams(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class SearchMoviesParams extends Params {
  final String query;
  final int page;

  const SearchMoviesParams({
    required this.query,
    this.page = 1,
  });

  @override
  List<Object> get props => [query, page];
}

class GetSimilarMoviesParams extends Params {
  final int movieId;
  final int page;

  const GetSimilarMoviesParams({
    required this.movieId,
    this.page = 1,
  });

  @override
  List<Object> get props => [movieId, page];
}

class GetMovieCastParams extends Params {
  final int movieId;

  const GetMovieCastParams(this.movieId);

  @override
  List<Object> get props => [movieId];
}