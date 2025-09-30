import 'package:flutter/material.dart';
import '../../../core/constants/design_tokens.dart';

/// Reusable loading widget that can be used across different pages
/// Displays a centered circular progress indicator with optional message
class Loading extends StatelessWidget {
  final String? message;

  const Loading({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: DesignTokens.spaceLarge),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}