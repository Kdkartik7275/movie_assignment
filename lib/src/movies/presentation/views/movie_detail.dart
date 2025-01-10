import 'package:flutter/material.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/presentation/widgets/info_row.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieEntity movie =
        ModalRoute.of(context)!.settings.arguments as MovieEntity;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double contentPadding = 16.0;
          double titleFontSize = 30.0;
          double infoFontSize = 16.0;

          if (constraints.maxWidth > 1200) {
            contentPadding = 32.0;
            titleFontSize = 40.0;
            infoFontSize = 18.0;
          }

          return Stack(
            children: [
              // Movie Poster Background
              Positioned.fill(
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                    child: Image.network(
                      movie.imageOriginal ??
                          "https://cdn.pixabay.com/photo/2022/07/17/19/22/movie-7328179_640.png",
                      fit: BoxFit.cover,
                    )),
              ),

              // Movie Details Content
              Positioned(
                left: contentPadding,
                right: contentPadding,
                bottom: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title and Rating
                    Text(
                      movie.name,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black87,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 22,
                        ),
                        SizedBox(width: 4),
                        Text(
                          movie.rating != null
                              ? movie.rating!.toString()
                              : "N/A",
                          style: TextStyle(
                            fontSize: titleFontSize * 0.6,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Action Buttons (Play and Add to Favorites)
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
                          label: Text("Play"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                          label: Text("My List"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Movie Info Section (Genres, Language, etc.)
                    buildInfoRow(
                        "Genres", movie.genres.join(', '), infoFontSize),
                    buildInfoRow("Language", movie.language, infoFontSize),
                    buildInfoRow("Status", movie.status, infoFontSize),
                    buildInfoRow(
                        "Premiered", movie.premiered ?? "N/A", infoFontSize),
                    buildInfoRow(
                      "Runtime",
                      movie.runtime != null ? "${movie.runtime} mins" : "N/A",
                      infoFontSize,
                    ),
                    SizedBox(height: 20),

                    // Summary Section
                    Container(
                      padding: EdgeInsets.all(contentPadding),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Summary",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: infoFontSize * 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            movie.summary ?? "No summary available",
                            style: TextStyle(color: Colors.grey[300]),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
