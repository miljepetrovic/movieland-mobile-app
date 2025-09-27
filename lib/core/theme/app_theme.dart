import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../constants/design_tokens.dart';

/// App theme configuration following Material Design principles
/// Based on the Android MovieLand app design
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceContainerLowest: AppColors.background,
        error: AppColors.error,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: DesignTokens.elevationNone,
        centerTitle: false,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        titleTextStyle: TextStyle(
          color: AppColors.onPrimary,
          fontSize: DesignTokens.fontTitleLarge,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        iconTheme: IconThemeData(
          color: AppColors.onPrimary,
          size: DesignTokens.appBarIconSize,
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.onPrimary,
        unselectedLabelColor: AppColors.greyLight,
        indicatorColor: AppColors.primaryLight, // Using accent color for indicator
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: DesignTokens.fontLabelLarge,
          fontWeight: FontWeight.w600, // Made bolder to match Android app
          letterSpacing: 0.5, // Slightly increased letter spacing
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: DesignTokens.fontLabelLarge,
          fontWeight: FontWeight.w500, // Slightly bolder for unselected too
          letterSpacing: 0.1,
        ),
        dividerColor: Colors.transparent,
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: DesignTokens.elevationSmall,
        color: AppColors.cardBackground,
        shadowColor: AppColors.cardShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMedium),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceSmall,
          vertical: DesignTokens.spaceExtraSmall,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        // Headlines
        headlineLarge: TextStyle(
          fontSize: DesignTokens.fontHeadlineLarge,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignTokens.fontHeadlineMedium,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: DesignTokens.fontHeadlineSmall,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),

        // Titles
        titleLarge: TextStyle(
          fontSize: DesignTokens.fontTitleLarge,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: DesignTokens.fontTitleMedium,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.onSurface,
        ),
        titleSmall: TextStyle(
          fontSize: DesignTokens.fontTitleSmall,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),

        // Body Text
        bodyLarge: TextStyle(
          fontSize: DesignTokens.fontBodyLarge,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.onSurface,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignTokens.fontBodyMedium,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.onSurface,
          height: 1.43,
        ),
        bodySmall: TextStyle(
          fontSize: DesignTokens.fontBodySmall,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.grey,
          height: 1.33,
        ),

        // Labels
        labelLarge: TextStyle(
          fontSize: DesignTokens.fontLabelLarge,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),
        labelMedium: TextStyle(
          fontSize: DesignTokens.fontLabelMedium,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: AppColors.onSurface,
        ),
        labelSmall: TextStyle(
          fontSize: DesignTokens.fontLabelSmall,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: AppColors.grey,
        ),
      ),

      // Scaffold Theme
      scaffoldBackgroundColor: AppColors.background,

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.greyLight,
        thickness: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.grey,
        size: DesignTokens.defaultIconSize,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: DesignTokens.elevationSmall,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMedium),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: DesignTokens.buttonPadding,
            vertical: DesignTokens.spaceSmall,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: DesignTokens.buttonPadding,
            vertical: DesignTokens.spaceSmall,
          ),
        ),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryLight,
        secondary: AppColors.greyLight,
        surface: AppColors.backgroundDark,
        surfaceContainerLowest: AppColors.backgroundDark,
        error: AppColors.error,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primaryLight,
        unselectedLabelColor: AppColors.grey,
        indicatorColor: AppColors.primaryLight,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
        ),
        dividerColor: Colors.transparent,
      ),

      // Scaffold Theme
      scaffoldBackgroundColor: AppColors.backgroundDark,
    );
  }
}