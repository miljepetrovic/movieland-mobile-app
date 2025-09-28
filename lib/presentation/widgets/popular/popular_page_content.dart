import 'package:flutter/material.dart';
import 'popular_movie_item.dart';

/// Content widget for the popular movies tab
/// Displays a list of popular movies using ListView
class PopularPageContent extends StatelessWidget {
  const PopularPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movieData.length,
      itemBuilder: (context, index) {
        final movie = _movieData[index];
        return PopularMovieItem(
          title: movie['title']!,
          description: movie['description']!,
          year: movie['year']!,
          voteCount: movie['voteCount']!,
          posterUrl: movie['posterUrl'],
        );
      },
    );
  }

  /// Hardcoded movie data matching the reference screenshot
  static const List<Map<String, dynamic>> _movieData = [
    {
      'title': 'Demon Slayer: Kimetsu no Yaiba',
      'description':
          'The Demon Slayer Corps are drawn into the Infinity Castle, where Tanjiro, Nezuko, and the Hashira face terrifying Upper Ran...',
      'year': '2025',
      'voteCount': 277,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'War of the Worlds',
      'description':
          'Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, unti...',
      'year': '2025',
      'voteCount': 544,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Weapons',
      'description':
          'When all but one child from the same class mysteriously vanish on the same night at exactly the same time, a community is lef...',
      'year': '2025',
      'voteCount': 1417,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'The Conjuring: Last Rites',
      'description':
          'Paranormal investigators Ed and Lorraine Warren take on one last terrifying case involving mysterious entities they must c...',
      'year': '2025',
      'voteCount': 363,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Nobody 2',
      'description':
          'Former assassin Hutch Mansell takes his family on a nostalgic vacation to a small-town theme park, only to be pulled ...',
      'year': '2025',
      'voteCount': 564,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Superman',
      'description':
          'Superman, a journalist in Metropolis, must learn to balance his dual identity while protecting the city from threats...',
      'year': '2025',
      'voteCount': 892,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
  ];
}
