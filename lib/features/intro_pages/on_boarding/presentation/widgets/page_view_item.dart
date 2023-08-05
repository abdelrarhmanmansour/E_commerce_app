import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.subTitle,
    required this.title,
  });
  final String? imagePath;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Spacer(flex: 2),
        const VerticalSpace(21),
        SizedBox(
            height: SizeConfig.defultSize! * 22,
            child: Image.asset(imagePath!)),
        const VerticalSpace(5),

        Text(
          title!,
          style: const TextStyle(
            color: Color(0xFF2F2E41),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpace(2),
        Text(
          subTitle!,
          style: const TextStyle(
            color: Color(0xFF78787C),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Spacer(flex: 3),
      ],
    );
  }
}
