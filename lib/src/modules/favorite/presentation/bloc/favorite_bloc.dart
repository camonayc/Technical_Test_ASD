import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/models/get_local_movies_params.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/usecases/get_favorite_usecase.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/domain/usecase/delete_favorite_usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUseCase getMovieUsecase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;

  int _currentPage = 1;

  FavoriteBloc({
    required this.getMovieUsecase,
    required this.deleteFavoriteUseCase,
  }) : super(FavoriteInitial()) {
    on<StartFavorite>(_onStartFavorite);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<DeleteFavorite>(_onDeleteFavorit);
  }

  Future<void> _onStartFavorite(
      StartFavorite event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());

    final result = await getMovieUsecase.call(GetLocalMoviesParams(page: 1));

    result.fold(
      (Failure l) => emit(FavoriteError(l.message ?? 'Error al cargar.')),
      (List<MovieModel> movies) {
        if (movies.isEmpty) {
          emit(FavoriteEmpty());
        } else {
          emit(FavoriteSuccess(movies: movies));
        }
      },
    );
  }

  Future<void> _onLoadMoreMovies(
      LoadMoreMovies event, Emitter<FavoriteState> emit) async {
    final currentState = state;
    if (currentState is! FavoriteSuccess || currentState.isLoadingMore) {
      return;
    }

    emit(FavoriteSuccess(movies: currentState.movies, isLoadingMore: true));

    final nextPage = _currentPage + 1;
    final result =
        await getMovieUsecase.call(GetLocalMoviesParams(page: nextPage));

    result.fold(
      (Failure l) => emit(
          FavoriteSuccess(movies: currentState.movies, isLoadingMore: false)),
      (List<MovieModel> newMovies) {
        if (newMovies.isNotEmpty) {
          _currentPage = nextPage;
          emit(FavoriteSuccess(movies: [...currentState.movies, ...newMovies]));
        } else {
          emit(FavoriteSuccess(
              movies: currentState.movies, isLoadingMore: false));
        }
      },
    );
  }

  Future<void> _onDeleteFavorit(
      DeleteFavorite event, Emitter<FavoriteState> emit) async {
    await deleteFavoriteUseCase.call(event.id);

    final result = await getMovieUsecase.call(GetLocalMoviesParams(page: 1));

    result.fold(
      (Failure l) => emit(FavoriteError(l.message ?? 'Error al cargar.')),
      (List<MovieModel> movies) {
        if (movies.isEmpty) {
          emit(FavoriteEmpty());
        } else {
          emit(FavoriteSuccess(movies: movies));
        }
      },
    );
  }
}
