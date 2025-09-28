import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'constants/app_constants.dart';
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
      home: const HomePage(),
    );
  }
}