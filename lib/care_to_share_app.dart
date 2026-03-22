import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareToShareApp extends StatelessWidget {
  const CareToShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create:
        //       (_) =>
        //           AuthCubit(getIt<AuthRepository>(), getIt<CacheRepository>()),
        // ),
        // BlocProvider(create: (_) => SoloCubit()),
        // BlocProvider(create: (_) => TeamCubit(getIt<TeamRepository>())),
        // BlocProvider(create: (_) => TeamGameCubit()),
        // BlocProvider(create: (_) => LeaderboardCubit(getIt<TeamRepository>())),
      ],
      child: Builder(
        builder: (context) {
          // Set up the auth interceptor service with AuthCubit getter
          // final authCubit = context.read<AuthCubit>();
          // final appRequestWithInterceptor = getIt<AppRequestWithInterceptor>();
          // appRequestWithInterceptor.setAuthCubitGetter(() => authCubit);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: appTheme,
            // initialRoute: Routes.initialRoute,
            // onGenerateRoute: Routes.generateRoute,
            // navigatorKey: AuthInterceptorService.navigatorKey,
          );
        },
      ),
    );
  }
}
