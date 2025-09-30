import 'package:equatable/equatable.dart';

abstract class UpcomingMoviesEvent extends Equatable {
  const UpcomingMoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadUpcomingMovies extends UpcomingMoviesEvent {
  const LoadUpcomingMovies();
}

class LoadMoreUpcomingMovies extends UpcomingMoviesEvent {
  const LoadMoreUpcomingMovies();
}