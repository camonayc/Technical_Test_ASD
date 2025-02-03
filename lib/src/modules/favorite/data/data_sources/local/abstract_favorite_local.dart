import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractFavoriteLocal {
  Future<List<MovieModel>> getMovies(int page, {int pageSize = 10});
}
