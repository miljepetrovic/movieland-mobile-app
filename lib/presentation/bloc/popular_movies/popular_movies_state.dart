import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie.dart';
import '../movie_status.dart';

final class PopularMoviesState extends Equatable {
  const PopularMoviesState({
    this.status = MovieStatus.initial,
    this.movies = const <Movie>[],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.errorMessage,
  });

  final MovieStatus status;
  final List<Movie> movies;
  final int currentPage;
  final bool hasReachedMax;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        movies,
        currentPage,
        hasReachedMax,
        errorMessage,
      ];

  PopularMoviesState copyWith({
    MovieStatus? status,
    List<Movie>? movies,
    int? currentPage,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PopularMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}