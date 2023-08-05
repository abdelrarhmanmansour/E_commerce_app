import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../on_boarding/presentation/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fedingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Because I use Only One AnimationController I Use ====> "with SingleTickerProviderStateMixin"
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fedingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: KMC,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          FadeTransition(
            opacity: fedingAnimation!,
            child: const Text(
              'Fruit Market',
              style: TextStyle(
                color: KWC,
                fontSize: 47,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            "assets/images/veg.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(() => const OnBoardingView(), transition: Transition.fade);
      },
    );
  }
}
