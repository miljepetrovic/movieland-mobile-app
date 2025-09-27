import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

/// Home page implementing tab-based navigation for movie categories
/// Follows the design from the Android MovieLand app
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize tab controller with configured number of tabs
    _tabController = TabController(length: AppConstants.tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: AppConstants.popularTab),
            Tab(text: AppConstants.topRatedTab),
            Tab(text: AppConstants.upcomingTab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _PopularMoviesTab(),
          _TopRatedMoviesTab(),
          _UpcomingMoviesTab(),
        ],
      ),
    );
  }
}

/// Popular movies tab content
class _PopularMoviesTab extends StatelessWidget {
  const _PopularMoviesTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie, size: AppConstants.placeholderIconSize, color: Colors.grey),
          SizedBox(height: AppConstants.spacingMedium),
          Text(
            AppConstants.popularMoviesTitle,
            style: TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: AppConstants.spacingSmall),
          Text(
            AppConstants.comingSoonText,
            style: TextStyle(fontSize: AppConstants.subtitleFontSize, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

/// Top rated movies tab content
class _TopRatedMoviesTab extends StatelessWidget {
  const _TopRatedMoviesTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, size: AppConstants.placeholderIconSize, color: Colors.grey),
          SizedBox(height: AppConstants.spacingMedium),
          Text(
            AppConstants.topRatedMoviesTitle,
            style: TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: AppConstants.spacingSmall),
          Text(
            AppConstants.comingSoonText,
            style: TextStyle(fontSize: AppConstants.subtitleFontSize, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

/// Upcoming movies tab content
class _UpcomingMoviesTab extends StatelessWidget {
  const _UpcomingMoviesTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.upcoming, size: AppConstants.placeholderIconSize, color: Colors.grey),
          SizedBox(height: AppConstants.spacingMedium),
          Text(
            AppConstants.upcomingMoviesTitle,
            style: TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: AppConstants.spacingSmall),
          Text(
            AppConstants.comingSoonText,
            style: TextStyle(fontSize: AppConstants.subtitleFontSize, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
