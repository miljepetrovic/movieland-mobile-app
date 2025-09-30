import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_movies_event.dart';
import '../../bloc/top_rated_movies/top_rated_movies_state.dart';
import '../common/loading.dart';
import '../common/app_error.dart';
import 'top_rated_movies_loaded_content.dart';

/// Content widget for the top rated movies tab
/// Displays a list of top rated movies using ListView with BLoC state management
class TopRatedPageContent extends StatefulWidget {
  const TopRatedPageContent({super.key});

  @override
  State<TopRatedPageContent> createState() => _TopRatedPageContentState();
}

class _TopRatedPageContentState extends State<TopRatedPageContent> {
  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<TopRatedMoviesBloc>().add(const LoadTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesLoading) {
          return const Loading(
            message: 'Loading top rated movies...',
          );
        }

        if (state is TopRatedMoviesError) {
          return AppError(
            message: state.message,
            onRetry: () => context
                .read<TopRatedMoviesBloc>()
                .add(const LoadTopRatedMovies()),
            retryButtonText: 'Reload Movies',
          );
        }

        if (state is TopRatedMoviesLoaded) {
          return TopRatedMoviesLoadedContent(
            movies: state.movies,
            hasReachedMax: state.hasReachedMax,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}