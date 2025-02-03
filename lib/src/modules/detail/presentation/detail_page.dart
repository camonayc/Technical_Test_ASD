import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/core/theme/app_typography.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/core/utils/types/page_from.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/bloc/detail_bloc.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/movi_cast.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/movie_genre.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/movie_info.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/movie_rating.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/widgets/movie_slider.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.movie,
    this.pageFrom = PageFrom.HOME,
  });

  final MovieModel movie;
  final PageFrom pageFrom;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocProvider<DetailBloc>(
        create: (context) => sl<DetailBloc>()..add(StartDetail(movie.id)),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25.sp,
                color: AppColors.mistBlue,
              ),
            ),
            title: Text(
              movie.title,
              style: AppTextStyle.headline.large.copyWith(
                color: AppColors.mistBlue,
              ),
            ),
            backgroundColor: AppColors.midnightBlue,
            actions: [
              if (pageFrom == PageFrom.HOME)
                BlocConsumer<DetailBloc, DetailState>(
                  listener: (BuildContext context, state) {
                    if (state is DetailError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (BuildContext context, state) {
                    final bool isFavorite =
                        context.read<DetailBloc>().isFavoriteState;
                    return IconButton(
                      onPressed: () {
                        if (isFavorite) {
                          context.read<DetailBloc>().add(DeleteFavorite(movie));
                        } else {
                          context.read<DetailBloc>().add(SaveMovie(movie));
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 35.sp,
                        color: isFavorite ? Colors.red : AppColors.steelBlue,
                      ),
                    );
                  },
                ),
            ],
          ),
          backgroundColor: AppColors.midnightBlue,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 70.h,
            ),
            child: Column(
              spacing: 20.h,
              children: [
                MovieSlider(movie: movie),
                BlocConsumer<DetailBloc, DetailState>(
                  listener: (BuildContext context, dynamic state) {
                    if (state is DetailError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (BuildContext context, DetailState state) {
                    if (state is DetailLoading) {
                      return Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: const CircularProgressIndicator(
                          color: AppColors.mistBlue,
                        ),
                      );
                    }
                    if (state is DetailSuccess) {
                      return Column(
                        spacing: 20.h,
                        children: [
                          MovieInfo(movie: movie),
                          MovieGenres(genres: state.detailMovie.genres),
                          MovieCast(castList: state.detailMovie.cast),
                          MovieRating(movie: movie),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
