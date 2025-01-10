// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';
import 'package:movies_assignment/src/movies/domain/usecases/search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies searchMovies;
  SearchBloc(
    this.searchMovies,
  ) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchMovies);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchMovies(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      final data = await searchMovies.call(event.query);
      data.fold((e) => emit(SearchError(e.toString())),
          (movies) => emit(SearchLoaded(movies)));
    } catch (e) {
      emit(SearchError('Failed to fetch movies: $e'));
    }
  }

  Future<void> _onClearSearch(
      ClearSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      emit(SearchInitial());
    } catch (e) {
      emit(SearchInitial());
    }
  }
}
