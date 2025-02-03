import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

abstract class AbstractHomeApi {
  Future<List<MovieModel>> getMovies(
      {required int page, required String sortBy});
  Future<List<MovieModel>> searchMovies({required String query, required int page});
}
