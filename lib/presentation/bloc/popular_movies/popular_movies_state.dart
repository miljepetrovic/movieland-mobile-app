import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;

  const PopularMoviesLoaded({
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [movies, hasReachedMax];

  PopularMoviesLoaded copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
  }) {
    return PopularMoviesLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  const PopularMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}