import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/shared/data/data_sources/local/abstract_movies_local.dart';

class MoviesLocalImpl extends AbstractMoviesLocal {
  MoviesLocalImpl(this._localService);

  final MovieLocalService _localService;

  @override
  Future<void> deleteMovie(int id) async {
    try {
      await _localService.deleteMovie(id);
    } catch (e) {
      Logger.error('[FavoriteLocalImpl.deleteMovie] $e');
      throw ErrorFailure.decode(e);
    }
  }
}
