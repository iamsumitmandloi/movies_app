import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/breakpoints.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/router/app_router.dart';
import '../../cubits/search/search_cubit.dart';
import '../../cubits/search/search_state.dart';
import '../../widgets/movie_grid.dart';
import '../../widgets/shimmer_placeholder.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  ResponsiveUtils.getHorizontalPadding(context),
                ),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search movies...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  context.read<SearchCubit>().clearSearch();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                      ),
                      onChanged: (query) {
                        context.read<SearchCubit>().searchMovies(query);
                      },
                    );
                  },
                ),
              ),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Padding(
                        padding: EdgeInsets.all(
                          ResponsiveUtils.getHorizontalPadding(context),
                        ),
                        child: MovieGridShimmer(
                          columns: ResponsiveUtils.getGridColumns(context),
                        ),
                      );
                    }

                    if (state is SearchLoaded) {
                      if (state.movies.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.search_off,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No movies found',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try searching with different keywords',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        padding: EdgeInsets.all(
                          ResponsiveUtils.getHorizontalPadding(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.movies.length} results found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            MovieGrid(
                              movies: state.movies,
                              columns: ResponsiveUtils.getGridColumns(context),
                              onMovieTap: (movie) {
                                context.router.push(
                                  MovieDetailRoute(movie: movie),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      );
                    }

                    if (state is SearchError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Search Error',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Search for movies',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Enter a movie title to get started',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
