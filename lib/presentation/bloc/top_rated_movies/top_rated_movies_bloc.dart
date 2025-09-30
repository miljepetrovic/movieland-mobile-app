import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import '../movie_status.dart';
import 'top_rated_movies_event.dart';
import 'top_rated_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  TopRatedMoviesBloc({
    required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase,
  })  : _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
        super(const TopRatedMoviesState()) {

    // Initial load - no throttling needed
    on<LoadTopRatedMovies>(_onLoadTopRatedMovies);

    // Pagination with throttling (300ms)
    on<LoadMoreTopRatedMovies>(
      _onLoadMoreTopRatedMovies,
      transformer: throttleDroppable(const Duration(milliseconds: 300)),
    );
  }

  Future<void> _onLoadTopRatedMovies(
    LoadTopRatedMovies event,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final movieResponse = await _getTopRatedMoviesUseCase(
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

  Future<void> _onLoadMoreTopRatedMovies(
    LoadMoreTopRatedMovies event,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    if (state.hasReachedMax || state.status != MovieStatus.success) return;

    try {
      final nextPage = state.currentPage + 1;

      final movieResponse = await _getTopRatedMoviesUseCase(
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