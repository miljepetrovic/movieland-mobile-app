import 'package:equatable/equatable.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadTopRatedMovies extends TopRatedMoviesEvent {
  const LoadTopRatedMovies();
}

class LoadMoreTopRatedMovies extends TopRatedMoviesEvent {
  const LoadMoreTopRatedMovies();
}