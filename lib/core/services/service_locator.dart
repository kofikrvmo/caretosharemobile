import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  // getIt.registerLazySingleton<AppRequestWithInterceptor>(
  //   () => AppRequestWithInterceptor(
  //     getIt<CacheRepository>(),
  //     ConfigEnvironments.getEnvironment(),
  //   ),
  // );
}
