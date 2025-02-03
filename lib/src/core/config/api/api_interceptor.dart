import 'package:dio/dio.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  final String _urlBase = Environment.config.baseUrl;
  final String _accessToken = Environment.config.accessToken;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = _urlBase;

    if (_accessToken.isNotEmpty) {
      options.headers.addAll(
        {
          'Authorization': 'Bearer $_accessToken',
        },
      );
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
