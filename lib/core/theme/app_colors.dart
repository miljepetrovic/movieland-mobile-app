import 'package:flutter/material.dart';

/// App color constants based on Material Design and Android MovieLand app
class AppColors {
  AppColors._();

  // Primary Colors - Based on the original Android MovieLand app colors
  static const Color primary = Color(0xFF14568C); // Original Android colorPrimary
  static const Color primaryVariant = Color(0xFF0E3F66); // Original Android colorPrimaryDark
  static const Color primaryLight = Color(0xFF2196F3); // Original Android colorAccent

  // Secondary Colors
  static const Color secondary = Color(0xFF424242); // Material Grey 800
  static const Color secondaryVariant = Color(0xFF616161); // Material Grey 700

  // Surface and Background Colors
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color background = Color(0xFFFAFAFA); // Light Grey
  static const Color backgroundDark = Color(0xFF121212); // Dark mode background

  // Text Colors - Based on Android app definitions
  static const Color textWhite = Color(0xFFFFFFFF); // Original Android textWhite
  static const Color onPrimary = textWhite; // White text on primary
  static const Color onSecondary = textWhite; // White text on secondary
  static const Color onSurface = Color(0xFF000000); // Black text on surface
  static const Color onBackground = Color(0xFF000000); // Black text on background

  // Additional Colors
  static const Color grey = Color(0xFF9E9E9E); // Material Grey 500
  static const Color greyLight = Color(0xFFE0E0E0); // Material Grey 300
  static const Color greyDark = Color(0xFF424242); // Material Grey 800

  // Status Colors
  static const Color error = Color(0xFFD32F2F); // Material Red 700
  static const Color warning = Color(0xFFF57C00); // Material Orange 700
  static const Color success = Color(0xFF388E3C); // Material Green 700

  // Tab Colors
  static const Color tabSelected = primary;
  static const Color tabUnselected = grey;
  static const Color tabIndicator = primary;

  // Card Colors
  static const Color cardBackground = surface;
  static const Color cardShadow = Color(0x1F000000); // Black with 12% opacity
}