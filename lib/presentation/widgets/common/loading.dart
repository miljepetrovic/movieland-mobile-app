import 'package:flutter/material.dart';

/// Reusable loading widget that can be used across different pages
/// Displays a centered circular progress indicator
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}