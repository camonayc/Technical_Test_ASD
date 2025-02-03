import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/get_movie_detail_usecase.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/is_favorite_usecase.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/save_movie_usecase.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';
import 'package:technical_test_asd/src/shared/domain/usecase/delete_favorite_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final SaveMovieUseCase saveMovieUseCase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  DetailMovieModel _detailMovieModel = DetailMovieModel.empty();
  bool isFavoriteState = false;

  DetailBloc({
    required this.getMovieDetailUseCase,
    required this.saveMovieUseCase,
    required this.deleteFavoriteUseCase,
    required this.isFavoriteUseCase,
  }) : super(DetailInitial()) {
    on<StartDetail>(_onStartDetail);
    on<SaveMovie>(_onSaveMovie);
    on<DeleteFavorite>(_onDeleteMovie);
  }

  Future<void> _onStartDetail(
      StartDetail event, Emitter<DetailState> emit) async {
    emit(DetailLoading());
    final isFavoriteResponse = await isFavoriteUseCase(event.id);

    final bool isFavorite = isFavoriteResponse.fold(
      (Failure l) => false,
      (bool r) => r,
    );
    isFavoriteState = isFavorite;

    final result = await getMovieDetailUseCase(event.id);

    result.fold(
      (Failure l) => emit(DetailError(l.message ?? 'Error al cargar.')),
      (DetailMovieModel detailMovie) {
        _detailMovieModel = detailMovie;
        emit(DetailSuccess(detailMovie, isFavoriteState));
      },
    );
  }

  Future<void> _onSaveMovie(SaveMovie event, Emitter<DetailState> emit) async {

    final result = await saveMovieUseCase.call(event.movie);

    result.fold(
      (l) {
        isFavoriteState = false;
        emit(DetailError(l.message ?? 'Error al guardar.'));
        emit(DetailSuccess(_detailMovieModel, false));
      },
      (r) {
        isFavoriteState = true;
        emit(DetailSuccess(_detailMovieModel, true));
      },
    );
  }

  Future<void> _onDeleteMovie(
      DeleteFavorite event, Emitter<DetailState> emit) async {

    final result = await deleteFavoriteUseCase.call(event.movie.id);

    result.fold(
      (l) {
        isFavoriteState = true;
        emit(DetailError(l.message ?? 'Error al eliminar.'));
        emit(DetailSuccess(_detailMovieModel, true));
      },
      (r) {
        isFavoriteState = false;
        emit(DetailSuccess(_detailMovieModel, false));
      },
    );
  }
}
