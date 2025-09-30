import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/upcoming_movies/upcoming_movies_bloc.dart';
import '../../bloc/upcoming_movies/upcoming_movies_event.dart';
import '../../bloc/upcoming_movies/upcoming_movies_state.dart';
import '../common/loading.dart';
import '../common/app_error.dart';
import 'upcoming_movies_loaded_content.dart';

/// Content widget for the upcoming movies tab
/// Displays a list of upcoming movies using ListView with BLoC state management
class UpcomingPageContent extends StatefulWidget {
  const UpcomingPageContent({super.key});

  @override
  State<UpcomingPageContent> createState() => _UpcomingPageContentState();
}

class _UpcomingPageContentState extends State<UpcomingPageContent> {
  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<UpcomingMoviesBloc>().add(const LoadUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesLoading) {
          return const Loading(
            message: 'Loading upcoming movies...',
          );
        }

        if (state is UpcomingMoviesError) {
          return AppError(
            message: state.message,
            onRetry: () => context
                .read<UpcomingMoviesBloc>()
                .add(const LoadUpcomingMovies()),
            retryButtonText: 'Reload Movies',
          );
        }

        if (state is UpcomingMoviesLoaded) {
          return UpcomingMoviesLoadedContent(
            movies: state.movies,
            hasReachedMax: state.hasReachedMax,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}