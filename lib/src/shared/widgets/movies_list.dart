import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/widgets/movie_card.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    this.movies = const [],
    this.isLoadingMore = false,
    this.isFavorite = false,
    required this.onSelect,
    this.onDelete,
  });

  final List<MovieModel> movies;
  final bool isLoadingMore;
  final bool isFavorite;
  final void Function(MovieModel movie) onSelect;
  final void Function(int id)? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 30.w,
        right: 30.w,
        bottom: 30.h,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == movies.length) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w,
            ),
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.mistBlue,
            )),
          );
        }

        return MovieCard(
          movie: movies[index],
          isFavorite: isFavorite,
          onTap: () => onSelect(
            movies[index],
          ),
          onDelete: () => onDelete?.call(movies[index].id),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 25.h,
      ),
    );
  }
}
