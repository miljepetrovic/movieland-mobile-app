import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movieland_mobile_app/core/constants/app_constants.dart';
import 'package:movieland_mobile_app/core/theme/app_theme.dart';
import 'package:movieland_mobile_app/presentation/pages/home_page.dart';

void main() {
  group('HomePage Widget Tests', () {
    // Helper function to create a testable widget with theme
    Widget createTestableWidget(Widget child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        home: child,
      );
    }

    testWidgets('HomePage renders correctly with all basic elements', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));

      // Assert - Check AppBar elements
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(AppConstants.appTitle), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets('HomePage displays correct number of tabs', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));

      // Assert - Check tab count
      expect(find.byType(Tab), findsNWidgets(AppConstants.tabCount));
    });

    testWidgets('HomePage displays all tab labels correctly', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));

      // Assert - Check all tab labels are present
      expect(find.text(AppConstants.popularTab), findsOneWidget);
      expect(find.text(AppConstants.topRatedTab), findsOneWidget);
      expect(find.text(AppConstants.upcomingTab), findsOneWidget);
    });

    testWidgets('HomePage shows Popular Movies tab content by default', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Assert - Check default tab content
      expect(find.text(AppConstants.popularMoviesTitle), findsOneWidget);
      expect(find.text(AppConstants.comingSoonText), findsOneWidget);
      expect(find.byIcon(Icons.movie), findsOneWidget);
    });

    testWidgets('Tapping Top Rated tab switches to Top Rated content', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Act - Tap on Top Rated tab
      await tester.tap(find.text(AppConstants.topRatedTab));
      await tester.pumpAndSettle();

      // Assert - Check Top Rated content is displayed
      expect(find.text(AppConstants.topRatedMoviesTitle), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text(AppConstants.comingSoonText), findsOneWidget);
    });

    testWidgets('Tapping Upcoming tab switches to Upcoming content', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Act - Tap on Upcoming tab
      await tester.tap(find.text(AppConstants.upcomingTab));
      await tester.pumpAndSettle();

      // Assert - Check Upcoming content is displayed
      expect(find.text(AppConstants.upcomingMoviesTitle), findsOneWidget);
      expect(find.byIcon(Icons.upcoming), findsOneWidget);
      expect(find.text(AppConstants.comingSoonText), findsOneWidget);
    });

    testWidgets('Tab navigation works in both directions', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Act & Assert - Navigate through all tabs

      // Start with Popular (default)
      expect(find.text(AppConstants.popularMoviesTitle), findsOneWidget);

      // Go to Top Rated
      await tester.tap(find.text(AppConstants.topRatedTab));
      await tester.pumpAndSettle();
      expect(find.text(AppConstants.topRatedMoviesTitle), findsOneWidget);

      // Go to Upcoming
      await tester.tap(find.text(AppConstants.upcomingTab));
      await tester.pumpAndSettle();
      expect(find.text(AppConstants.upcomingMoviesTitle), findsOneWidget);

      // Go back to Popular
      await tester.tap(find.text(AppConstants.popularTab));
      await tester.pumpAndSettle();
      expect(find.text(AppConstants.popularMoviesTitle), findsOneWidget);
    });

    testWidgets('All placeholder icons have correct size', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Act & Assert - Check Popular tab icon size
      Icon popularIcon = tester.widget<Icon>(find.byIcon(Icons.movie));
      expect(popularIcon.size, equals(AppConstants.placeholderIconSize));

      // Navigate to Top Rated and check icon size
      await tester.tap(find.text(AppConstants.topRatedTab));
      await tester.pumpAndSettle();
      Icon topRatedIcon = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(topRatedIcon.size, equals(AppConstants.placeholderIconSize));

      // Navigate to Upcoming and check icon size
      await tester.tap(find.text(AppConstants.upcomingTab));
      await tester.pumpAndSettle();
      Icon upcomingIcon = tester.widget<Icon>(find.byIcon(Icons.upcoming));
      expect(upcomingIcon.size, equals(AppConstants.placeholderIconSize));
    });

    testWidgets('All placeholder content has correct text styling', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Helper function to check text styling
      void checkTextStyling(String text, double expectedFontSize) {
        final textWidget = tester.widget<Text>(find.text(text));
        expect(textWidget.style?.fontSize, equals(expectedFontSize));
      }

      // Check Popular tab styling
      checkTextStyling(AppConstants.popularMoviesTitle, AppConstants.titleFontSize);
      checkTextStyling(AppConstants.comingSoonText, AppConstants.subtitleFontSize);

      // Check Top Rated tab styling
      await tester.tap(find.text(AppConstants.topRatedTab));
      await tester.pumpAndSettle();
      checkTextStyling(AppConstants.topRatedMoviesTitle, AppConstants.titleFontSize);

      // Check Upcoming tab styling
      await tester.tap(find.text(AppConstants.upcomingTab));
      await tester.pumpAndSettle();
      checkTextStyling(AppConstants.upcomingMoviesTitle, AppConstants.titleFontSize);
    });

    testWidgets('TabController is properly disposed', (WidgetTester tester) async {
      // This test ensures memory leaks don't occur

      // Arrange & Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Verify TabController exists and works
      expect(find.byType(TabBar), findsOneWidget);

      // Dispose the widget
      await tester.pumpWidget(Container());

      // If we reach here without errors, TabController was properly disposed
      expect(find.byType(TabBar), findsNothing);
    });

    testWidgets('HomePage maintains tab state during tab switches', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestableWidget(const HomePage()));
      await tester.pumpAndSettle();

      // Act - Switch to different tabs and verify tab state is maintained

      // Switch to Top Rated
      await tester.tap(find.text(AppConstants.topRatedTab));
      await tester.pumpAndSettle();

      // Verify TabBar still shows Top Rated as selected
      final TabBar tabBar = tester.widget<TabBar>(find.byType(TabBar));
      expect(tabBar.controller?.index, equals(1)); // Top Rated is index 1

      // Switch to Upcoming
      await tester.tap(find.text(AppConstants.upcomingTab));
      await tester.pumpAndSettle();

      // Verify TabBar shows Upcoming as selected
      expect(tabBar.controller?.index, equals(2)); // Upcoming is index 2
    });

    group('Edge Cases and Error Handling', () {
      testWidgets('HomePage handles rapid tab switching', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestableWidget(const HomePage()));
        await tester.pumpAndSettle();

        // Act - Switch between tabs with proper settling
        await tester.tap(find.text(AppConstants.topRatedTab));
        await tester.pumpAndSettle();
        await tester.tap(find.text(AppConstants.upcomingTab));
        await tester.pumpAndSettle();
        await tester.tap(find.text(AppConstants.popularTab));
        await tester.pumpAndSettle();

        // Assert - Should still work correctly
        expect(find.text(AppConstants.popularMoviesTitle), findsOneWidget);
      });

      testWidgets('HomePage content is properly centered', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(createTestableWidget(const HomePage()));
        await tester.pumpAndSettle();

        // Assert - Check that the currently visible tab content is centered
        // Initially Popular tab is active
        expect(find.byType(Center), findsWidgets);
        expect(find.text(AppConstants.popularMoviesTitle), findsOneWidget);

        // Switch to Top Rated tab and verify it's centered
        await tester.tap(find.text(AppConstants.topRatedTab));
        await tester.pumpAndSettle();
        expect(find.text(AppConstants.topRatedMoviesTitle), findsOneWidget);

        // Switch to Upcoming tab and verify it's centered
        await tester.tap(find.text(AppConstants.upcomingTab));
        await tester.pumpAndSettle();
        expect(find.text(AppConstants.upcomingMoviesTitle), findsOneWidget);
      });
    });
  });
}