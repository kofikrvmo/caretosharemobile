import 'package:caretosharemobile/core/routes/app_routes.dart';
import 'package:caretosharemobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _appStart() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, AppRoutes.signinView);
  }

  @override
  void initState() {
    super.initState();
    _appStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset('assets/images/logo.png'))],
      ),
    );
  }
}
