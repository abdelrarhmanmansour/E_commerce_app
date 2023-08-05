import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/intro_pages/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KMC,
      body: SplashViewBody(),
    );
  }
}
