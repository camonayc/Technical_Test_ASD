import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/core/utils/types/page_from.dart';
import 'package:technical_test_asd/src/modules/home/presentation/bloc/home_bloc.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/custom_header.dart';
import 'package:technical_test_asd/src/shared/widgets/movies_list.dart';
import 'package:technical_test_asd/src/shared/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(StartHome()),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  late ScrollController _scrollController;
  late FocusNode _focusNode;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _focusNode = FocusNode();
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    final double threshold = 30.h;

    setState(() {
      _opacity = offset > threshold ? 0.0 : 1.0;
    });

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<HomeBloc>().add(LoadMoreMovies());
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
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.midnightBlue,
          bottomNavigationBar: const NavBar(),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  CustomHeader(
                    title: 'Películas',
                    opacity: _opacity,
                    focusNode: _focusNode,
                    onSearch: (query) =>
                        context.read<HomeBloc>().add(SearchMovies(query)),
                  ),
                  SliverToBoxAdapter(
                    child: BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state is HomeError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is HomeLoading || state is HomeEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Center(
                              child: state is HomeLoading
                                  ? const CircularProgressIndicator(
                                      color: AppColors.mistBlue,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
                                      child: Text(
                                        'No hay películas disponibles',
                                        style: AppTextStyle.headline.large
                                            .copyWith(
                                          color: AppColors.mistBlue,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                            ),
                          );
                        }

                        if (state is HomeSuccess) {
                          return MoviesList(
                            movies: state.movies,
                            isLoadingMore: state.isLoadingMore,
                            onSelect: (MovieModel movie) {
                              _focusNode.unfocus();
                              context.push(
                                '/detail',
                                extra: {
                                  'movie': movie,
                                  'pageFrom': PageFrom.HOME,
                                },
                              );
                            },
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
