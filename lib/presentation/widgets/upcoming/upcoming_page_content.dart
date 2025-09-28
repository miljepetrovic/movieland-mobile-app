import 'package:flutter/material.dart';
import 'upcoming_movie_item.dart';

/// Content widget for the upcoming movies tab
/// Displays a list of upcoming movies using ListView
class UpcomingPageContent extends StatelessWidget {
  const UpcomingPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movieData.length,
      itemBuilder: (context, index) {
        final movie = _movieData[index];
        return UpcomingMovieItem(
          title: movie['title']!,
          description: movie['description']!,
          releaseDate: movie['releaseDate']!,
          posterUrl: movie['posterUrl'],
        );
      },
    );
  }

  /// Hardcoded upcoming movie data matching the reference screenshot
  static const List<Map<String, dynamic>> _movieData = [
    {
      'title': 'One Battle After Another',
      'description':
          'When their evil nemesis resurfaces after 16 years, a band of ex-revolutionaries reunite to rescue the daughter of one of t...',
      'releaseDate': '23 September 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'TRON: Ares',
      'description':
          'A highly sophisticated Program called Ares is sent from the digital world into the real world on a dangerous mission, marking h...',
      'releaseDate': '8 October 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'The Smashing Machine',
      'description':
          'The story of legendary mixed martial arts and UFC fighter Mark Kerr.',
      'releaseDate': '2 October 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Black Phone 2',
      'description':
          'Four years after escaping The Grabber, Finney Blake, now 17, is struggling with his life after captivity. His sister Gwen be...',
      'releaseDate': '15 October 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Dead of Winter',
      'description':
          'A widowed fisherwoman, travelling alone through snowbound northern Minnesota, interrupts the kidnapping of a teenage girl...',
      'releaseDate': '23 September 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'The Strangers: Chapter 2',
      'description':
          'When they learn that one of their victims, Maya, is still alive, they return to finish what they started and take her...',
      'releaseDate': '10 October 2025',
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
  ];
}