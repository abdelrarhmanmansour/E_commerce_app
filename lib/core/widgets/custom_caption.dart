import 'package:e_commerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomCaption extends StatelessWidget {
  const CustomCaption({
    super.key,
    required this.mainCaption,
    required this.subCaption,
    required this.sale,
  });
  final String? mainCaption;
  final String? subCaption;
  final String? sale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.defultSize! * 1, top: SizeConfig.defultSize! * 1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          mainCaption!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF141313),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              subCaption!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF141313),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.defultSize! * 2),
              child: Text(
                sale!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF4CA300),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
