import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test_asd/src/core/utils/types/base_config.dart';

class Config extends BaseConfig {
  @override
  String get accessToken => dotenv.env['ACCESS_TOKEN'] ?? '';

  @override
  bool get bannerVisibility => dotenv.env['BANNER_VISIBILITY'] == 'TRUE';

  @override
  String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  @override
  String get environment => dotenv.env['ENVIRONMENT'] ?? '';
  
  @override
  String get imageBaseUrl => dotenv.env['IMAGE_BASE_URL'] ?? '';
}
