import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_upcoming_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import '../movie_status.dart';
import 'upcoming_movies_event.dart';
import 'upcoming_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  UpcomingMoviesBloc({
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  })  : _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase,
        super(const UpcomingMoviesState()) {

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
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final movieResponse = await _getUpcomingMoviesUseCase(
        const GetMoviesParams(page: 1),
      );

      final hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(state.copyWith(
        status: MovieStatus.success,
        movies: movieResponse.movies,
        currentPage: 1,
        hasReachedMax: hasReachedMax,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadMoreUpcomingMovies(
    LoadMoreUpcomingMovies event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    if (state.hasReachedMax || state.status != MovieStatus.success) return;

    try {
      final nextPage = state.currentPage + 1;

      final movieResponse = await _getUpcomingMoviesUseCase(
        GetMoviesParams(page: nextPage),
      );

      final hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(state.copyWith(
        status: MovieStatus.success,
        movies: [...state.movies, ...movieResponse.movies],
        currentPage: nextPage,
        hasReachedMax: hasReachedMax,
        errorMessage: null,
      ));
    } catch (e) {
      // Keep status as success to preserve visible movies
      // Only set error message for potential Snackbar/Toast notification
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }
}