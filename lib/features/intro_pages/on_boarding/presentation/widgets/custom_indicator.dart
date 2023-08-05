import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.currentDotIndex});
  final double? currentDotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: KMC,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: KMC))),
      dotsCount: 3,
      position: currentDotIndex!.toInt(),
    );
  }
}
