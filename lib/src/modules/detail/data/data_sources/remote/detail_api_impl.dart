import 'package:technical_test_asd/src/core/config/api/api_client.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/remote/abstract_detail_api.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/cast.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/detail_movie_model.dart';

class DetailApiImpl extends AbstractDetailApi {
  DetailApiImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DetailMovieModel> getMovieDetail(int id) async {
    try {
      final response = await _apiClient.get(
        '${Environment.config.baseUrl}/movie/$id',
        queryParameters: {
          'language': 'es-ES',
        },
      );

      if (response.statusCode == 200) {
        DetailMovieModel detailMovieModel =
            DetailMovieModel.fromJson(response.data);

        final cast = await _getDetailCast(id);

        detailMovieModel = detailMovieModel.copyWith(cast: cast);

        return detailMovieModel;
      }
      throw ErrorFailure.decode(response.statusMessage);
    } catch (e) {
      Logger.error('[DetailApiImpl.getMovieDetail] $e');
      throw ErrorFailure.decode(e);
    }
  }

  Future<List<Cast>> _getDetailCast(int id) async {
    try {
      final response = await _apiClient.get(
        '${Environment.config.baseUrl}/movie/$id/credits',
        queryParameters: {
          'language': 'es-ES',
        },
      );

      if (response.statusCode == 200) {
        return (response.data['cast'] as List<dynamic>)
            .map((dynamic e) => Cast.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
