import 'package:either_dart/either.dart';
import 'package:technical_test_asd/src/core/utils/failure.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/local/abstract_detail_local.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/remote/abstract_detail_api.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';
import 'package:technical_test_asd/src/modules/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class DetailRepositoryImpl extends AbstractDetailRepository {
  DetailRepositoryImpl(
    this._detailApi,
    this._detailLocal,
  );

  final AbstractDetailApi _detailApi;
  final AbstractDetailLocal _detailLocal;

  @override
  Future<Either<Failure, DetailMovieModel>> getMovieDetail(int id) async {
    try {
      final DetailMovieModel movie = await _detailApi.getMovieDetail(id);
      return Right(movie);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> saveMovie(MovieModel movie) async {
    try {
      await _detailLocal.saveMovieDetail(movie);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(int id) async {
    try {
      final isFavorite = await _detailLocal.isFavorite(id);
      return Right(isFavorite);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
