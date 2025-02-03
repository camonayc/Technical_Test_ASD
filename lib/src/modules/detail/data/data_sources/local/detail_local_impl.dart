import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/local/abstract_detail_local.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class DetailLocalImpl extends AbstractDetailLocal {
  DetailLocalImpl(this._localService);

  final MovieLocalService _localService;

  @override
  Future<void> saveMovieDetail(MovieModel movie) async {
    try {
      await _localService.saveMovie(movie);
      return;
    } catch (e) {
      Logger.error('[DetailLocalImpl.saveMovieDetail] $e');
      throw ErrorFailure.decode(e);
    }
  }

  @override
  Future<bool> isFavorite(int id) async {
    try {
      return await _localService.movieExists(id);
    } catch (e) {
      Logger.error('[DetailLocalImpl.isFavorite] $e');
      throw ErrorFailure.decode(e);
    }
  }
}
