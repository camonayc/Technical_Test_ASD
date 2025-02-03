import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/get_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/models/search_movies_params.dart';
import 'package:technical_test_asd/src/modules/home/domain/usecases/get_movie_usecase.dart';
import 'package:technical_test_asd/src/modules/home/domain/usecases/search_movie_usecase.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMovieUsecase getMovieUsecase;
  final SearchMovieUseCase searchMoviesUseCase;

  int _currentPage = 1;

  HomeBloc({
    required this.getMovieUsecase,
    required this.searchMoviesUseCase,
  }) : super(HomeInitial()) {
    on<StartHome>(_onStartHome);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onStartHome(StartHome event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    _currentPage = 1;

    final result =
        await getMovieUsecase.call(GetMoviesParams(page: _currentPage));

    result.fold(
      (Failure l) => emit(HomeError(l.message ?? 'Error al cargar.')),
      (List<MovieModel> movies) {
        if (movies.isEmpty) {
          emit(HomeEmpty());
        } else {
          emit(HomeSuccess(movies: movies));
        }
      },
    );
  }

  Future<void> _onLoadMoreMovies(
      LoadMoreMovies event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is! HomeSuccess || currentState.isLoadingMore) {
      return;
    }

    emit(HomeSuccess(movies: currentState.movies, isLoadingMore: true));

    final nextPage = _currentPage + 1;
    final result = await getMovieUsecase.call(GetMoviesParams(page: nextPage));

    result.fold(
      (Failure l) =>
          emit(HomeSuccess(movies: currentState.movies, isLoadingMore: false)),
      (List<MovieModel> newMovies) {
        if (newMovies.isNotEmpty) {
          _currentPage = nextPage;
          emit(HomeSuccess(movies: [...currentState.movies, ...newMovies]));
        } else {
          emit(HomeSuccess(movies: currentState.movies, isLoadingMore: false));
        }
      },
    );
  }

  Future<void> _onSearchMovies(
      SearchMovies event, Emitter<HomeState> emit) async {
    if (event.query.isEmpty) {
      add(StartHome());
      return;
    }

    final result =
        await searchMoviesUseCase.call(SearchMoviesParams(query: event.query));

    result.fold(
      (Failure l) => emit(HomeError(l.message ?? 'Error en la búsqueda.')),
      (List<MovieModel> searchResults) {
        if (searchResults.isEmpty) {
          emit(HomeEmpty());
        } else {
          emit(HomeSuccess(movies: searchResults));
        }
      },
    );
  }
}
