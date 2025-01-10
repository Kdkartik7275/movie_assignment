import 'package:flutter/material.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movie-details', arguments: movie);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardHeight = 150;

          if (constraints.maxWidth > 1200) {
            cardHeight = 100;
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                // Movie Image Background
                Image.network(
                  movie.imageOriginal ??
                      'https://cdn.pixabay.com/photo/2022/07/17/19/22/movie-7328179_640.png',
                  height: cardHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Overlay for Movie Information
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Title with reduced spacing from the image
                      Text(
                        movie.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Movie Genres
                      Text(
                        movie.genres.join(', '),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating != null
                                    ? movie.rating.toString()
                                    : 'N/A',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          // Runtime
                          Text(
                            '${movie.runtime} min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
