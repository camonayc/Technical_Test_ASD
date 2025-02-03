import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractHomeLocal {
  Future<void> saveMovie(MovieModel movie);
}
