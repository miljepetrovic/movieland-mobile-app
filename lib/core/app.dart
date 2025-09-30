import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/app_theme.dart';
import 'constants/app_constants.dart';
import 'di/injection_container.dart' as di;
import '../presentation/bloc/popular_movies/popular_movies_bloc.dart';
import '../presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import '../presentation/pages/home_page.dart';

/// Main application widget for MovieLand
/// Configures MaterialApp with theme, routing, and initial page
class MovieLandApp extends StatelessWidget {
  const MovieLandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PopularMoviesBloc>(
            create: (context) => di.sl<PopularMoviesBloc>(),
          ),
          BlocProvider<TopRatedMoviesBloc>(
            create: (context) => di.sl<TopRatedMoviesBloc>(),
          ),
          BlocProvider<UpcomingMoviesBloc>(
            create: (context) => di.sl<UpcomingMoviesBloc>(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}