import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/modules/favorite/data/data_sources/local/abstract_favorite_local.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class FavoriteLocalImpl extends AbstractFavoriteLocal {
  FavoriteLocalImpl(this._localService);

  final MovieLocalService _localService;

  @override
  Future<List<MovieModel>> getMovies(int page, {int pageSize = 5}) async {
    try {
      return _localService.getMovies(page, pageSize: pageSize);
    } catch (e) {
      Logger.error('[FavoriteLocalImpl.getMovies] $e');
      throw ErrorFailure.decode(e);
    }
  }
}
