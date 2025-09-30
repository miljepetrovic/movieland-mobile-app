import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/popular_movies/popular_movies_bloc.dart';
import '../../bloc/popular_movies/popular_movies_event.dart';
import 'popular_movie_item.dart';

/// Private widget that handles the loaded state for popular movies
/// Displays the list with infinite scroll and pull-to-refresh functionality
class PopularMoviesLoadedContent extends StatefulWidget {
  final List<Movie> movies;
  final bool hasReachedMax;

  const PopularMoviesLoadedContent({
    super.key,
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  State<PopularMoviesLoadedContent> createState() => _PopularMoviesLoadedContentState();
}

class _PopularMoviesLoadedContentState extends State<PopularMoviesLoadedContent> {
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
      context.read<PopularMoviesBloc>().add(const LoadMorePopularMovies());
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
        context.read<PopularMoviesBloc>().add(const LoadPopularMovies());
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
          return PopularMovieItem(movie: widget.movies[index]);
        },
      ),
    );
  }
}