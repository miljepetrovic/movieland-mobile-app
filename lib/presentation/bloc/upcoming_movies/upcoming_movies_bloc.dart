import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_upcoming_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import 'upcoming_movies_event.dart';
import 'upcoming_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  int _currentPage = 1;
  bool _hasReachedMax = false;

  UpcomingMoviesBloc({
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  })  : _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase,
        super(const UpcomingMoviesInitial()) {

    // Initial load - no throttling needed
    on<LoadUpcomingMovies>(_onLoadUpcomingMovies);

    // Pagination with throttling (300ms)
    on<LoadMoreUpcomingMovies>(
      _onLoadMoreUpcomingMovies,
      transformer: throttleDroppable(const Duration(milliseconds: 300)),
    );
  }

  Future<void> _onLoadUpcomingMovies(
    LoadUpcomingMovies event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    emit(const UpcomingMoviesLoading());

    try {
      _currentPage = 1;
      _hasReachedMax = false;

      final movieResponse = await _getUpcomingMoviesUseCase(
        const GetMoviesParams(page: 1),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(UpcomingMoviesLoaded(
        movies: movieResponse.movies,
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(UpcomingMoviesError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreUpcomingMovies(
    LoadMoreUpcomingMovies event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    if (_hasReachedMax) return;

    final currentState = state;
    if (currentState is! UpcomingMoviesLoaded) return;

    try {
      _currentPage++;

      final movieResponse = await _getUpcomingMoviesUseCase(
        GetMoviesParams(page: _currentPage),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(UpcomingMoviesLoaded(
        movies: [...currentState.movies, ...movieResponse.movies],
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(UpcomingMoviesError(message: e.toString()));
    }
  }
}