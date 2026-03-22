// import 'package:flutter/material.dart';
// import 'package:caretosharemobile/blocs/auth/auth_cubit.dart';
// import 'package:caretosharemobile/core/routes/app_routes.dart';

// class AuthInterceptorService {
//   static final AuthInterceptorService _instance =
//       AuthInterceptorService._internal();
//   factory AuthInterceptorService() => _instance;
//   AuthInterceptorService._internal();

//   static final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey<NavigatorState>();
//   String? _redirectRoute;
//   Map<String, dynamic>? _redirectArguments;
//   bool _isRedirecting = false;

//   /// Store the current route before redirecting to login
//   void storeCurrentRoute(String route, [Map<String, dynamic>? arguments]) {
//     if (route != AppRoutes.signinView && route != AppRoutes.signupView) {
//       _redirectRoute = route;
//       _redirectArguments = arguments;
//     }
//   }

//   /// Handle 401 unauthorized response
//   Future<void> handleUnauthorized(AuthCubit authCubit) async {
//     if (_isRedirecting) return; // Prevent multiple redirects

//     _isRedirecting = true;

//     // Logout user
//     // await authCubit.logout();

//     // Navigate to login using GlobalKey
//     if (navigatorKey.currentState != null) {
//       navigatorKey.currentState!.pushNamedAndRemoveUntil(
//         AppRoutes.signinView,
//         (route) => false,
//       );
//     }

//     _isRedirecting = false;
//   }

//   /// Redirect back to the original screen after successful login
//   Future<void> redirectToOriginalScreen(BuildContext context) async {
//     if (_redirectRoute != null && navigatorKey.currentState != null) {
//       final route = _redirectRoute!;
//       final arguments = _redirectArguments;

//       // Clear stored route
//       _redirectRoute = null;
//       _redirectArguments = null;

//       // Navigate to the original screen using GlobalKey
//       if (arguments != null) {
//         navigatorKey.currentState!.pushReplacementNamed(
//           route,
//           arguments: arguments,
//         );
//       } else {
//         navigatorKey.currentState!.pushReplacementNamed(route);
//       }
//     } else if (navigatorKey.currentState != null) {
//       // Default to home if no stored route
//       navigatorKey.currentState!.pushReplacementNamed(AppRoutes.mainView);
//     }
//   }

//   /// Check if there's a stored route to redirect to
//   bool get hasStoredRoute => _redirectRoute != null;

//   /// Get the stored route
//   String? get storedRoute => _redirectRoute;

//   /// Clear stored route (useful for manual navigation)
//   void clearStoredRoute() {
//     _redirectRoute = null;
//     _redirectArguments = null;
//   }
// }
