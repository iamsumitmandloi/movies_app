import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/cubits/paginator/paginator_cubit.dart';
import 'package:movies_app/presentation/cubits/paginator/paginator_state.dart';
import 'package:movies_app/presentation/widgets/movie_card.dart';
import 'package:movies_app/presentation/widgets/shimmer_placeholder.dart';

@RoutePage()
class MovieListingsPage extends StatefulWidget {
  const MovieListingsPage({
    super.key,
    required this.title,
    required this.dataType,
  });

  final String title;
  final PaginatorDataType dataType;

  @override
  State<MovieListingsPage> createState() => _MovieListingsPageState();
}

class _MovieListingsPageState extends State<MovieListingsPage> {
  final ScrollController _scrollController = ScrollController();
  late final PaginatorCubit _paginatorCubit;

  @override
  void initState() {
    super.initState();
    _paginatorCubit = context.read<PaginatorCubit>()
      ..loadPage(widget.dataType, 1);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !_paginatorCubit.state.hasReachedMax &&
        !_paginatorCubit.state.isLoadingMore) {
      _paginatorCubit.loadPage(widget.dataType, _paginatorCubit.state.page + 1);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<PaginatorCubit, PaginatorState>(
        builder: (context, state) {
          if (state.isLoading && state.movies.isEmpty) {
            return _buildShimmerGrid();
          }

          if (state.error != null && state.movies.isEmpty) {
            return _buildError(state.error!.message);
          }

          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.hasReachedMax
                ? state.movies.length
                : state.movies.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.movies.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final movie = state.movies[index];
              return MovieCard(
                movie: movie,
                onTap: () {
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: ShimmerPlaceholder(),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _paginatorCubit.loadPage(widget.dataType, 1),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
