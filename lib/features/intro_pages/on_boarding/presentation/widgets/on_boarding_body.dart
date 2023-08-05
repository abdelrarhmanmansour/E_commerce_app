import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../auth/presentation/login/login_page_view.dart';
import 'custom_indicator.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
          bottom: SizeConfig.defultSize! * 21,
          left: SizeConfig.defultSize! * 13,
          right: SizeConfig.defultSize! * 13,
          child: CustomIndicator(
            currentDotIndex:
                pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Positioned(
          top: SizeConfig.defultSize! * 10,
          right: 32,
          child: Visibility(
            visible: pageController!.hasClients
                ? pageController!.page == 2
                    ? false
                    : true
                : false,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const LoginPageView(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 600));
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF898989),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.defultSize! * 13,
          right: SizeConfig.defultSize! * 13,
          bottom: SizeConfig.defultSize! * 10,
          child: CustomGeneralButton(
            onTap: () {
              if (pageController!.page! < 2) {
                pageController!.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => const LoginPageView(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 600));
              }
            },
            buttonTitle: pageController!.hasClients
                ? pageController!.page == 2
                    ? 'Get Started'
                    : 'Next'
                : 'Next',
          ),
        )
      ],
    );
  }
}
