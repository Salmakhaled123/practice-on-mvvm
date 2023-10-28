import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/utils/app_router.dart';
import 'package:products/core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
   navigateToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Center(child: Image.asset(AppAssets.splashLogo)) );
  }
  void navigateToHome()
  {
    Future.delayed(const Duration(seconds: 4),()
    {
      GoRouter.of(context).push(AppRouter.homeView);
    });
  }
}
