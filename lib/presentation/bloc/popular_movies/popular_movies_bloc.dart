import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_popular_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  int _currentPage = 1;
  bool _hasReachedMax = false;

  PopularMoviesBloc({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(const PopularMoviesInitial()) {

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
    emit(const PopularMoviesLoading());

    try {
      _currentPage = 1;
      _hasReachedMax = false;

      final movieResponse = await _getPopularMoviesUseCase(
        const GetMoviesParams(page: 1),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(PopularMoviesLoaded(
        movies: movieResponse.movies,
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(PopularMoviesError(message: e.toString()));
    }
  }

  Future<void> _onLoadMorePopularMovies(
    LoadMorePopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    if (_hasReachedMax) return;

    final currentState = state;
    if (currentState is! PopularMoviesLoaded) return;

    try {
      _currentPage++;

      final movieResponse = await _getPopularMoviesUseCase(
        GetMoviesParams(page: _currentPage),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(PopularMoviesLoaded(
        movies: [...currentState.movies, ...movieResponse.movies],
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(PopularMoviesError(message: e.toString()));
    }
  }
}