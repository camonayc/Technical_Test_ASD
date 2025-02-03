import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_asd/src/core/utils/types/page_from.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/detail_page.dart';
import 'package:technical_test_asd/src/modules/favorite/presentation/favorite_page.dart';
import 'package:technical_test_asd/src/modules/home/presentation/home_pages.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritePage(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const FavoritePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final arg = (state.extra as Map<String, dynamic>?) ?? {};
        final MovieModel movie =
            (arg['movie'] as MovieModel?) ?? MovieModel.empty();
        final PageFrom pageFrom = arg['pageFrom'] as PageFrom;
        return DetailPage(movie: movie, pageFrom: pageFrom);
      },
      pageBuilder: (context, state) {
        final arg = (state.extra as Map<String, dynamic>?) ?? {};
        final MovieModel movie =
            (arg['movie'] as MovieModel?) ?? MovieModel.empty();
        final PageFrom pageFrom = arg['pageFrom'] as PageFrom;
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailPage(movie: movie, pageFrom: pageFrom),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: true,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
