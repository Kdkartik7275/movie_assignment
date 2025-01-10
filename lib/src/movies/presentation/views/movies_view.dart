import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/widgets/movie_card.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  void initState() {
    context.read<MoviesBloc>().add(FetchMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Movies',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MovieState>(builder: (context, state) {
        if (state is MovieLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else if (state is MovieLoaded) {
          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 2;
              double aspectRatio = 0.8;

              if (constraints.maxWidth > 1200) {
                crossAxisCount = 6;
                aspectRatio = 1.0;
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 3;
                aspectRatio = 1.2;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: aspectRatio,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    return MovieCard(movie: movie);
                  },
                ),
              );
            },
          );
        } else if (state is MovieError) {
          return Center(
            child: Text(state.message, style: TextStyle(color: Colors.white)),
          );
        } else {
          return SizedBox.shrink();
        }
      }),
    );
  }
}
