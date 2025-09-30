import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/popular_movies/popular_movies_bloc.dart';
import '../../bloc/popular_movies/popular_movies_event.dart';
import '../../bloc/popular_movies/popular_movies_state.dart';
import '../common/loading.dart';
import '../common/app_error.dart';
import 'popular_movies_loaded_content.dart';

/// Content widget for the popular movies tab
/// Displays a list of popular movies using ListView with BLoC state management
class PopularPageContent extends StatefulWidget {
  const PopularPageContent({super.key});

  @override
  State<PopularPageContent> createState() => _PopularPageContentState();
}

class _PopularPageContentState extends State<PopularPageContent> {
  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<PopularMoviesBloc>().add(const LoadPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const Loading(
            message: 'Loading popular movies...',
          );
        }

        if (state is PopularMoviesError) {
          return AppError(
            message: state.message,
            onRetry: () => context
                .read<PopularMoviesBloc>()
                .add(const LoadPopularMovies()),
            retryButtonText: 'Reload Movies',
          );
        }

        if (state is PopularMoviesLoaded) {
          return PopularMoviesLoadedContent(
            movies: state.movies,
            hasReachedMax: state.hasReachedMax,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
