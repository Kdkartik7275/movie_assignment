import 'package:movies_assignment/core/usecase/usecase.dart';
import 'package:movies_assignment/core/utils/typedefs.dart';
import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/domain/repository/movie_repository.dart';

class SearchMovies implements UseCaseWithParams<List<MovieEntity>, String> {
  final MovieRepository repository;

  SearchMovies({required this.repository});
  @override
  ResultFuture<List<MovieEntity>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
