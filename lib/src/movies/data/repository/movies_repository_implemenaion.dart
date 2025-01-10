import 'package:fpdart/fpdart.dart';
import 'package:movies_assignment/core/exceptions/failure.dart';
import 'package:movies_assignment/core/utils/typedefs.dart';
import 'package:movies_assignment/src/movies/data/data_source/movie_data_source.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/domain/repository/movie_repository.dart';

class MoviesRepositoryImplemenaion implements MovieRepository {
  final MovieDataSource dataSource;

  MoviesRepositoryImplemenaion({required this.dataSource});
  @override
  ResultFuture<List<MovieEntity>> fetchMovies() async {
    try {
      final movies = await dataSource.fetchMovies();

      return right(movies);
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<MovieEntity>> searchMovies(String query) async {
    try {
      final movies = await dataSource.searchMovies(query);

      return right(movies);
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
