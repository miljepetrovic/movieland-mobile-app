/// Application-wide constants for text, numbers, and configuration values
class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'MovieLand';
  static const String appTitle = 'MovieLand';

  // Tab Configuration
  static const int tabCount = 3;

  // Tab Names
  static const String popularTab = 'POPULAR';
  static const String topRatedTab = 'TOP RATED';
  static const String upcomingTab = 'UPCOMING';

  // Placeholder Text
  static const String popularMoviesTitle = 'Popular Movies';
  static const String topRatedMoviesTitle = 'Top Rated Movies';
  static const String upcomingMoviesTitle = 'Upcoming Movies';
  static const String comingSoonText = 'Coming soon...';

  // Icon Sizes
  static const double placeholderIconSize = 64.0;

  // Spacing Constants
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;

  // Text Sizes
  static const double titleFontSize = 24.0;
  static const double subtitleFontSize = 16.0;
  static const double tabFontSize = 14.0;

  // Tab Labels List (for easy iteration)
  static const List<String> tabLabels = [
    popularTab,
    topRatedTab,
    upcomingTab,
  ];

  // Tab Titles List (for easy iteration)
  static const List<String> tabTitles = [
    popularMoviesTitle,
    topRatedMoviesTitle,
    upcomingMoviesTitle,
  ];
}