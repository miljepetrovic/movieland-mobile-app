import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/popular_movies/popular_movies_bloc.dart';
import '../../bloc/popular_movies/popular_movies_event.dart';
import '../../bloc/popular_movies/popular_movies_state.dart';
import '../../bloc/movie_status.dart';
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
        switch (state.status) {
          case MovieStatus.initial:
            return const SizedBox.shrink();
          case MovieStatus.loading:
            return const Loading();
          case MovieStatus.failure:
            return AppError(
              message: state.errorMessage ?? 'Unknown error occurred',
              onRetry: () => context
                  .read<PopularMoviesBloc>()
                  .add(const LoadPopularMovies()),
              retryButtonText: 'Reload Movies',
            );
          case MovieStatus.success:
            return PopularMoviesLoadedContent(
              movies: state.movies,
              hasReachedMax: state.hasReachedMax,
            );
        }
      },
    );
  }
}
