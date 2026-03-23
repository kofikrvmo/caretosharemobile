import 'package:caretosharemobile/core/routes/app_routes.dart';
import 'package:caretosharemobile/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareToShareApp extends StatelessWidget {
  const CareToShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Set up the auth interceptor service with AuthCubit getter
        // final authCubit = context.read<AuthCubit>();
        // final appRequestWithInterceptor = getIt<AppRequestWithInterceptor>();
        // appRequestWithInterceptor.setAuthCubitGetter(() => authCubit);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: Routes.generateRoute,
          // navigatorKey: AuthInterceptorService.navigatorKey,
        );
      },
    );
  }
}
