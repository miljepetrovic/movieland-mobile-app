import 'package:flutter/material.dart';
import 'top_rated_movie_item.dart';

/// Content widget for the top rated movies tab
/// Displays a list of top rated movies using ListView
class TopRatedPageContent extends StatelessWidget {
  const TopRatedPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movieData.length,
      itemBuilder: (context, index) {
        final movie = _movieData[index];
        return TopRatedMovieItem(
          title: movie['title']!,
          description: movie['description']!,
          year: movie['year']!,
          rating: movie['rating']!,
          posterUrl: movie['posterUrl'],
        );
      },
    );
  }

  /// Hardcoded top rated movie data matching the reference screenshot
  static const List<Map<String, dynamic>> _movieData = [
    {
      'title': 'The Shawshank Redemption',
      'description':
          'Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins ...',
      'year': '1994',
      'rating': 8.712,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'The Godfather',
      'description':
          'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized cr...',
      'year': '1972',
      'rating': 8.686,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'The Godfather Part II',
      'description':
          'In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the ...',
      'year': '1974',
      'rating': 8.57,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Schindler\'s List',
      'description':
          'The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as ...',
      'year': '1993',
      'rating': 8.566,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': '12 Angry Men',
      'description':
          'The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanis...',
      'year': '1957',
      'rating': 8.549,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
    {
      'title': 'Spirited Away',
      'description':
          'A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transform...',
      'year': '2001',
      'rating': 8.537,
      'posterUrl':
          'https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg',
    },
  ];
}