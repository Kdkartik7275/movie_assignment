import 'package:movies_assignment/core/utils/typedefs.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';

abstract interface class MovieRepository {
  ResultFuture<List<MovieEntity>> fetchMovies();
  ResultFuture<List<MovieEntity>> searchMovies(String query);
}
