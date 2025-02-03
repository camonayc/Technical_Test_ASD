import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';

abstract class AbstractDetailApi {
  Future<DetailMovieModel> getMovieDetail(int id);
}
