import 'design_tokens.dart';

/// Application-wide constants for text, numbers, and configuration values
/// Design tokens (spacing, typography) are imported from design_tokens.dart
class AppConstants {
  AppConstants._();

  // ==================== APP INFORMATION ====================
  static const String appName = 'MovieLand';
  static const String appTitle = 'MovieLand';

  // ==================== TAB CONFIGURATION ====================
  static const int tabCount = 3;

  // Tab Names
  static const String popularTab = 'POPULAR';
  static const String topRatedTab = 'TOP RATED';
  static const String upcomingTab = 'UPCOMING';

  // ==================== PLACEHOLDER TEXT ====================
  static const String popularMoviesTitle = 'Popular Movies';
  static const String topRatedMoviesTitle = 'Top Rated Movies';
  static const String upcomingMoviesTitle = 'Upcoming Movies';
  static const String comingSoonText = 'Coming soon...';

  // ==================== DESIGN TOKEN REFERENCES ====================
  // These reference the centralized design tokens for consistency

  // Icon Sizes (from design tokens)
  static double get placeholderIconSize => DesignTokens.placeholderIconSize;

  // Spacing Constants (from design tokens)
  static double get spacingSmall => DesignTokens.spaceSmall;
  static double get spacingMedium => DesignTokens.spaceLarge;
  static double get spacingLarge => DesignTokens.spaceDoubleExtraLarge;

  // Text Sizes (from design tokens)
  static double get titleFontSize => DesignTokens.titleFontSize;
  static double get subtitleFontSize => DesignTokens.subtitleFontSize;
  static double get tabFontSize => DesignTokens.tabFontSize;

  // ==================== DATA COLLECTIONS ====================
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