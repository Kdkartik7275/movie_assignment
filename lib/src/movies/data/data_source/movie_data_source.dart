import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_assignment/src/movies/data/model/movie_model.dart';

abstract interface class MovieDataSource {
  Future<List<MovieModel>> fetchMovies();
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieDataSourceImpl extends MovieDataSource {
  final http.Client client;

  MovieDataSourceImpl({required this.client});
  @override
  Future<List<MovieModel>> fetchMovies() async {
    try {
      List<MovieModel> movies = [];
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (response.statusCode == 200) {
        final movieData = jsonDecode(response.body);

        for (var movie in movieData) {
          movies.add(MovieModel.fromJson(movie));
        }
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      List<MovieModel> movies = [];
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
      if (response.statusCode == 200) {
        final movieData = jsonDecode(response.body);

        for (var movie in movieData) {
          movies.add(MovieModel.fromJson(movie));
        }
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
