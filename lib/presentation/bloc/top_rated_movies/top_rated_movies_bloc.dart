import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../../domain/use_cases/params/movie_params.dart';
import 'top_rated_movies_event.dart';
import 'top_rated_movies_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  int _currentPage = 1;
  bool _hasReachedMax = false;

  TopRatedMoviesBloc({
    required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase,
  })  : _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
        super(const TopRatedMoviesInitial()) {

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
    emit(const TopRatedMoviesLoading());

    try {
      _currentPage = 1;
      _hasReachedMax = false;

      final movieResponse = await _getTopRatedMoviesUseCase(
        const GetMoviesParams(page: 1),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(TopRatedMoviesLoaded(
        movies: movieResponse.movies,
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(TopRatedMoviesError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreTopRatedMovies(
    LoadMoreTopRatedMovies event,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    if (_hasReachedMax) return;

    final currentState = state;
    if (currentState is! TopRatedMoviesLoaded) return;

    try {
      _currentPage++;

      final movieResponse = await _getTopRatedMoviesUseCase(
        GetMoviesParams(page: _currentPage),
      );

      _hasReachedMax = movieResponse.movies.isEmpty ||
          movieResponse.page >= movieResponse.totalPages;

      emit(TopRatedMoviesLoaded(
        movies: [...currentState.movies, ...movieResponse.movies],
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(TopRatedMoviesError(message: e.toString()));
    }
  }
}