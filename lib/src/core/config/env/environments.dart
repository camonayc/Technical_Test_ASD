import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test_asd/src/core/config/env/config.dart';
import 'package:technical_test_asd/src/core/config/env/envs.dart';
import 'package:technical_test_asd/src/core/utils/types/base_config.dart';
import 'package:technical_test_asd/src/core/utils/types/env_type.dart';

class Environment {
  factory Environment() => _instance;

  Environment._internal();
  static final Environment _instance = Environment._internal();

  static late BaseConfig config;

  Future<void> initConfig({required EnvType env}) async {
    config = await _getConfig(env);
  }

  Future<BaseConfig> _getConfig(EnvType environment) async {
    switch (environment) {
      case EnvType.DEV:
        await dotenv.load(fileName: Envs.envDEV);
        return Config();
      case EnvType.PROD:
        await dotenv.load(fileName: Envs.envPROD);
        return Config();
    }
  }
}
