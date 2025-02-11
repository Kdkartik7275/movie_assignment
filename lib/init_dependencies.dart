import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_assignment/src/movies/data/data_source/movie_data_source.dart';
import 'package:movies_assignment/src/movies/data/repository/movies_repository_implemenaion.dart';
import 'package:movies_assignment/src/movies/domain/repository/movie_repository.dart';
import 'package:movies_assignment/src/movies/domain/usecases/fetch_movies.dart';
import 'package:movies_assignment/src/movies/domain/usecases/search_movies.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/search/search_bloc.dart';
part 'init_dependencies_main.dart';
