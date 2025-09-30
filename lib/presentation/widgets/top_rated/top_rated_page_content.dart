import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_movies_event.dart';
import '../../bloc/top_rated_movies/top_rated_movies_state.dart';
import '../../bloc/movie_status.dart';
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
        switch (state.status) {
          case MovieStatus.initial:
            return const SizedBox.shrink();
          case MovieStatus.loading:
            return const Loading();
          case MovieStatus.failure:
            return AppError(
              message: state.errorMessage ?? 'Unknown error occurred',
              onRetry: () => context
                  .read<TopRatedMoviesBloc>()
                  .add(const LoadTopRatedMovies()),
              retryButtonText: 'Reload Movies',
            );
          case MovieStatus.success:
            return TopRatedMoviesLoadedContent(
              movies: state.movies,
              hasReachedMax: state.hasReachedMax,
            );
        }
      },
    );
  }
}