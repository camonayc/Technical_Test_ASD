import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractDetailLocal {
  Future<void> saveMovieDetail(MovieModel movie);
  Future<bool> isFavorite(int id);
}
