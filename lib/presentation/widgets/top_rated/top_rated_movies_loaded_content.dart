import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../../core/constants/api_constants.dart';
import '../../bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_movies_event.dart';
import 'top_rated_movie_item.dart';

/// Private widget that handles the loaded state for top rated movies
/// Displays the list with infinite scroll and pull-to-refresh functionality
class TopRatedMoviesLoadedContent extends StatefulWidget {
  final List<Movie> movies;
  final bool hasReachedMax;

  const TopRatedMoviesLoadedContent({
    super.key,
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  State<TopRatedMoviesLoadedContent> createState() => _TopRatedMoviesLoadedContentState();
}

class _TopRatedMoviesLoadedContentState extends State<TopRatedMoviesLoadedContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottomReached && !widget.hasReachedMax) {
      context.read<TopRatedMoviesBloc>().add(const LoadMoreTopRatedMovies());
    }
  }

  bool get _isBottomReached {
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TopRatedMoviesBloc>().add(const LoadTopRatedMovies());
      },
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.hasReachedMax
            ? widget.movies.length
            : widget.movies.length + 1,
        itemBuilder: (context, index) {
          if (index >= widget.movies.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          final movie = widget.movies[index];
          return TopRatedMovieItem(
            title: movie.title,
            description: movie.overview,
            year: movie.releaseDate.year.toString(),
            rating: movie.voteAverage,
            posterUrl: movie.posterPath != null
                ? '${ApiConstants.imageBaseUrl}${movie.posterPath}'
                : null,
          );
        },
      ),
    );
  }
}