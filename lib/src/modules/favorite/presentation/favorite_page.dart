import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/core/utils/types/page_from.dart';
import 'package:technical_test_asd/src/modules/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/movies_list.dart';
import 'package:technical_test_asd/src/shared/widgets/navbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => sl<FavoriteBloc>()..add(StartFavorite()),
      child: const _FavoritePageContent(),
    );
  }
}

class _FavoritePageContent extends StatefulWidget {
  const _FavoritePageContent();

  @override
  State<_FavoritePageContent> createState() => _FavoritePageContentState();
}

class _FavoritePageContentState extends State<_FavoritePageContent> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<FavoriteBloc>().add(LoadMoreMovies());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favoritas',
            style: AppTextStyle.display.large.copyWith(
              color: AppColors.mistBlue,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80.h,
          backgroundColor: AppColors.carbonBlue,
          surfaceTintColor: Colors.transparent,
        ),
        backgroundColor: AppColors.midnightBlue,
        bottomNavigationBar: const NavBar(),
        body: BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is FavoriteLoading || state is FavoriteEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: state is FavoriteLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.mistBlue,
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Text(
                            'No hay películas disponibles',
                            style: AppTextStyle.headline.large.copyWith(
                              color: AppColors.mistBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              );
            }

            if (state is FavoriteSuccess) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: MoviesList(
                  movies: state.movies,
                  isLoadingMore: state.isLoadingMore,
                  isFavorite: true,
                  onSelect: (MovieModel movie) => context.push(
                    '/detail',
                    extra: {
                      'movie': movie,
                      'pageFrom': PageFrom.FAVORITE,
                    },
                  ),
                  onDelete: (int id) => context.read<FavoriteBloc>().add(
                        DeleteFavorite(id),
                      ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
