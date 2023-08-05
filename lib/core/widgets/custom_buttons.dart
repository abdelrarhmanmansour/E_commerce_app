import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {super.key, required this.buttonTitle, required this.onTap});
  final String? buttonTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: 60,
            decoration: BoxDecoration(
                color: KMC, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                buttonTitle!,
                style: const TextStyle(
                  color: KWC,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGeneralButtonWithIcon extends StatelessWidget {
  const CustomGeneralButtonWithIcon({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    required this.imagePath,
    //required this.iconPath,
  });
  final String? buttonTitle;
  // final IconData? iconPath;
  final VoidCallback? onTap;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF707070),
            )),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imagePath!,
            height: SizeConfig.defultSize! * 4.5,
            width: SizeConfig.defultSize! * 4.5,
          ),
          const HorizintalSpace(2),
          Text(
            buttonTitle!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
  }
}
