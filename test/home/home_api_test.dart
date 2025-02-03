import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_test_asd/src/core/config/api/api_client.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/utils/error/error.dart';
import 'package:technical_test_asd/src/core/utils/types/env_type.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/remote/home_api_impl.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

import 'home_api_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late HomeApiImpl homeApiImpl;
  late MockApiClient mockApiClient;

  setUpAll(() async {
    final env = Environment();
    await env.initConfig(env: EnvType.DEV);
  });

  setUp(() {
    mockApiClient = MockApiClient();
    homeApiImpl = HomeApiImpl(mockApiClient);
  });

  group('getMovies', () {
    test('should return list of movies when response is successful', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: {
          'results': [
            {'id': 1, 'title': 'Movie 1'},
            {'id': 2, 'title': 'Movie 2'}
          ]
        },
      );

      when(mockApiClient.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result =
          await homeApiImpl.getMovies(page: 1, sortBy: 'popularity.desc');

      expect(result, isA<List<MovieModel>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].title, 'Movie 1');
    });

    test('should throw ErrorFailure when response is unsuccessful', () async {
      when(mockApiClient.get(any, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response:
            Response(statusCode: 400, requestOptions: RequestOptions(path: '')),
        type: DioExceptionType.badResponse,
      ));

      expect(() => homeApiImpl.getMovies(page: 1, sortBy: 'popularity.desc'),
          throwsA(isA<ErrorFailure>()));
    });
  });

  group('searchMovies', () {
    test('should return list of movies when response is successful', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: {
          'results': [
            {'id': 1, 'title': 'Search Movie'}
          ]
        },
      );

      when(mockApiClient.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await homeApiImpl.searchMovies(query: 'query', page: 1);

      expect(result, isA<List<MovieModel>>());
      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].title, 'Search Movie');
    });

    test('should throw ErrorFailure when response is unsuccessful', () async {
      when(mockApiClient.get(any, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response:
            Response(statusCode: 400, requestOptions: RequestOptions(path: '')),
        type: DioExceptionType.badResponse,
      ));

      expect(() => homeApiImpl.searchMovies(query: 'query', page: 1),
          throwsA(isA<ErrorFailure>()));
    });
  });
}
