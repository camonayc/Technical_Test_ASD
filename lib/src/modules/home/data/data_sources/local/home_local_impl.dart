import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/local/abstract_home_local.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class HomeLocalImpl extends AbstractHomeLocal {
  HomeLocalImpl(this._localService);

  final MovieLocalService _localService;

  @override
  Future<void> saveMovie(MovieModel movie) async {
    try {
      await _localService.saveMovie(movie);
    } catch (e) {
      throw ErrorFailure.decode(e);
    }
  }
}
