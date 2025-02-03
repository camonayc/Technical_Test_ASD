import 'package:dio/dio.dart';
import 'package:technical_test_asd/src/core/config/api/api_interceptor.dart';

class ApiClient with DioMixin implements Dio {
  ApiClient() {
    options = BaseOptions();
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(ApiInterceptor());
  }
}
