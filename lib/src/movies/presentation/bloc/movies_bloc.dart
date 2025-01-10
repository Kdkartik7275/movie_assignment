// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/domain/usecases/fetch_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  final FetchMovies fetchMovies;
  MoviesBloc(
    this.fetchMovies,
  ) : super(MovieInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(
      FetchMoviesEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());

    try {
      final data = await fetchMovies.call();
      data.fold((e) => emit(MovieError(e.toString())),
          (movies) => emit(MovieLoaded(movies)));
    } catch (e) {
      emit(MovieError('Failed to fetch movies: $e'));
    }
  }
}
