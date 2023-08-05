import 'package:e_commerce/features/intro_pages/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          imagePath: "assets/images/onboarding1.png",
          subTitle: "Explore  top organic fruits & grab them",
          title: "E Shopping",
        ),
        PageViewItem(
          imagePath: "assets/images/onboarding2.png",
          subTitle: "Get your order by speed delivery",
          title: "Delivery on the way",
        ),
        PageViewItem(
          imagePath: "assets/images/onboarding3.png",
          subTitle: "Order is arrived at your Place",
          title: "Delivery Arrived",
        )
      ],
    );
  }
}
