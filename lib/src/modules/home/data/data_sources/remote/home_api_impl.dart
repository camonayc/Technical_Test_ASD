import 'package:technical_test_asd/src/core/config/api/api_client.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/logger.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class HomeApiImpl extends AbstractHomeApi {
  HomeApiImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<MovieModel>> getMovies({
    required int page,
    required String sortBy,
  }) async {
    try {
      final response = await _apiClient.get(
        '${Environment.config.baseUrl}/discover/movie',
        queryParameters: {
          'include_adult': 'false',
          'include_video': 'false',
          'language': 'es-ES',
          'sort_by': sortBy,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> dataResponse = response.data['results'];

        return dataResponse.map((dynamic e) => MovieModel.fromJson(e)).toList();
      }

      throw ErrorFailure.decode(response.statusMessage);
    } catch (e) {
      Logger.error('[HomeApiImpl.getMovies] $e');
      throw ErrorFailure.decode(e);
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(
      {required String query, required int page}) async {
    try {
      final response = await _apiClient.get(
        '${Environment.config.baseUrl}/search/movie',
        queryParameters: {
          'query': query,
          'include_adult': 'false',
          'language': 'es-ES',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> dataResponse = response.data['results'];

        return dataResponse.map((dynamic e) => MovieModel.fromJson(e)).toList();
      }

      throw ErrorFailure.decode(response.statusMessage);
    } catch (e) {
      Logger.error('[HomeApiImpl.searchMovies] $e');
      throw ErrorFailure.decode(e);
    }
  }
}
