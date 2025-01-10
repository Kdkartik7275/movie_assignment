part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initMovies();

  // ---------------------------- CORE  ---------------------------

  sl.registerLazySingleton(() => Client());
}

_initMovies() {
  // DATASOURCE
  sl
    ..registerFactory<MovieDataSource>(() => MovieDataSourceImpl(client: sl()))

    // REPOSITORY
    ..registerFactory<MovieRepository>(
        () => MoviesRepositoryImplemenaion(dataSource: sl()))
    // USECASES

    ..registerFactory(() => FetchMovies(repository: sl()))
    ..registerFactory(() => SearchMovies(repository: sl()))

    // BLOC
    ..registerFactory(() => MoviesBloc(
          sl(),
        ))
    ..registerFactory(() => SearchBloc(
          sl(),
        ));
}
