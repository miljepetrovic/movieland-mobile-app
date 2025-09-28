import 'package:flutter/material.dart';

/// Extension methods for BuildContext to provide convenient access to theme properties
extension ContextExtensions on BuildContext {
  /// Quick access to the current theme's text theme
  /// Usage: context.textTheme.titleMedium
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Quick access to the current theme's color scheme
  /// Usage: context.colorScheme.primary
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Quick access to the current theme
  /// Usage: context.theme.appBarTheme
  ThemeData get theme => Theme.of(this);

  /// Quick access to media query
  /// Usage: context.mediaQuery.size.width
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Quick access to screen size
  /// Usage: context.screenSize.width
  Size get screenSize => MediaQuery.of(this).size;

  /// Quick access to screen width
  /// Usage: context.screenWidth
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Quick access to screen height
  /// Usage: context.screenHeight
  double get screenHeight => MediaQuery.of(this).size.height;
}