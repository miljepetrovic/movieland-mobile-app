import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {
  const TopRatedMoviesInitial();
}

class TopRatedMoviesLoading extends TopRatedMoviesState {
  const TopRatedMoviesLoading();
}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;

  const TopRatedMoviesLoaded({
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [movies, hasReachedMax];

  TopRatedMoviesLoaded copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
  }) {
    return TopRatedMoviesLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  const TopRatedMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}