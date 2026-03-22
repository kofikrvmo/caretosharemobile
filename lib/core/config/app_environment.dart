import 'package:caretosharemobile/core/utils/enums/app_environment.dart';

class ConfigEnvironments {
  static late AppEnvironment currentEnvironment;

  static initialize(AppEnvironment env) {
    currentEnvironment = env;
  }

  static final List<Map<String, dynamic>> _appEnvironments = [
    {
      'env': AppEnvironment.development,
      'apiEndPoint': 'https://apidemo.thaiuniongame.com',
      'wsEndPoint': 'ws://apidemo.thaiuniongame.com',
    },
    {
      'env': AppEnvironment.production,
      'apiEndPoint': 'http:production-url',
      'wsEndPoint': 'http:production-url',
    },
  ];

  static Map<String, dynamic> getEnvironment() {
    return _appEnvironments.firstWhere((d) => d['env'] == currentEnvironment);
  }

  static String getBaseUrl() {
    return _appEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironment,
    )['apiEndPoint']!;
  }

  static String getWsUrl() {
    return _appEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironment,
    )['wsEndPoint']!;
  }
}
