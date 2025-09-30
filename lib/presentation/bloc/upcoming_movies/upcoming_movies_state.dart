import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {
  const UpcomingMoviesInitial();
}

class UpcomingMoviesLoading extends UpcomingMoviesState {
  const UpcomingMoviesLoading();
}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;

  const UpcomingMoviesLoaded({
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [movies, hasReachedMax];

  UpcomingMoviesLoaded copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
  }) {
    return UpcomingMoviesLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class UpcomingMoviesError extends UpcomingMoviesState {
  final String message;

  const UpcomingMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}