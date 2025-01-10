import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/bloc/search/search_bloc.dart';
import 'package:movies_assignment/src/movies/presentation/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
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

            return BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          context.read<SearchBloc>().add(ClearSearch());
                        } else {
                          context
                              .read<SearchBloc>()
                              .add(SearchQueryChanged(value));
                        }
                      },
                      onSubmitted: (value) {
                        if (value.isEmpty) {
                          context.read<SearchBloc>().add(ClearSearch());
                        }
                      },
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                        hintText: "Enter movie name",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  state is SearchLoaded
                      ? Expanded(
                          child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: aspectRatio,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            final movie = state.results[index];
                            return MovieCard(movie: movie);
                          },
                        ))
                      : state is SearchLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is SearchError
                              ? Text(state.message)
                              : const SizedBox.shrink()
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
