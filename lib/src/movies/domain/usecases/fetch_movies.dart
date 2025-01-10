import 'package:movies_assignment/core/usecase/usecase.dart';
import 'package:movies_assignment/core/utils/typedefs.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/domain/repository/movie_repository.dart';

class FetchMovies implements UseCaseWithoutParams<List<MovieEntity>> {
  final MovieRepository repository;

  FetchMovies({required this.repository});
  @override
  ResultFuture<List<MovieEntity>> call() async {
    return await repository.fetchMovies();
  }
}
