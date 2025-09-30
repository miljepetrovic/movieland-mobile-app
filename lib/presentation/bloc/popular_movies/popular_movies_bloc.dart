import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_popular_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import '../movie_status.dart';
import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesBloc({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(const PopularMoviesState()) {

    // Initial load - no throttling needed
    on<LoadPopularMovies>(_onLoadPopularMovies);

    // Pagination with throttling (300ms)
    on<LoadMorePopularMovies>(
      _onLoadMorePopularMovies,
      transformer: throttleDroppable(const Duration(milliseconds: 300)),
    );
  }

  Future<void> _onLoadPopularMovies(
    LoadPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final movieResponse = await _getPopularMoviesUseCase(
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

  Future<void> _onLoadMorePopularMovies(
    LoadMorePopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    if (state.hasReachedMax || state.status != MovieStatus.success) return;

    try {
      final nextPage = state.currentPage + 1;

      final movieResponse = await _getPopularMoviesUseCase(
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