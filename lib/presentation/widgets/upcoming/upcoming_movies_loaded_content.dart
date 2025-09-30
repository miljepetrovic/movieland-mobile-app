import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../../core/constants/api_constants.dart';
import '../../bloc/upcoming_movies/upcoming_movies_bloc.dart';
import '../../bloc/upcoming_movies/upcoming_movies_event.dart';
import 'upcoming_movie_item.dart';

/// Private widget that handles the loaded state for upcoming movies
/// Displays the list with infinite scroll and pull-to-refresh functionality
class UpcomingMoviesLoadedContent extends StatefulWidget {
  final List<Movie> movies;
  final bool hasReachedMax;

  const UpcomingMoviesLoadedContent({
    super.key,
    required this.movies,
    required this.hasReachedMax,
  });

  @override
  State<UpcomingMoviesLoadedContent> createState() => _UpcomingMoviesLoadedContentState();
}

class _UpcomingMoviesLoadedContentState extends State<UpcomingMoviesLoadedContent> {
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
      context.read<UpcomingMoviesBloc>().add(const LoadMoreUpcomingMovies());
    }
  }

  bool get _isBottomReached {
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200;
  }

  String _getMonthName(int month) {
    const monthNames = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UpcomingMoviesBloc>().add(const LoadUpcomingMovies());
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
          return UpcomingMovieItem(
            title: movie.title,
            description: movie.overview,
            releaseDate: '${movie.releaseDate.day} ${_getMonthName(movie.releaseDate.month)} ${movie.releaseDate.year}',
            posterUrl: movie.posterPath != null
                ? '${ApiConstants.imageBaseUrl}${movie.posterPath}'
                : null,
          );
        },
      ),
    );
  }
}