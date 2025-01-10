import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_assignment/init_dependencies.dart';
import 'package:movies_assignment/splash_screen.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/search/search_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/views/movie_detail.dart';
import 'package:movies_assignment/src/movies/presentation/views/movie_seach.dart';
import 'package:movies_assignment/src/movies/presentation/views/movies_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => sl<MoviesBloc>()),
    BlocProvider(create: (_) => sl<SearchBloc>()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/movies': (context) => MoviesView(),
        '/search': (context) => SearchScreen(),
        '/movie-details': (context) => MovieDetailsScreen(),
      },
    );
  }
}
