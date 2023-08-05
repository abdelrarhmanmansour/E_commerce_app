import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/item_model.dart';
import '../product/search_products.dart';

class CustomAppBar extends StatelessWidget {
  final List<ItemModel> products;

  const CustomAppBar({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(180),
      child: Container(
        height: 180,
        child: Stack(
          children: <Widget>[
            Container(
              color: KMC,
              width: SizeConfig.screenWidth,
              height: 130,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Fruit Market',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 26,
                        color: KWC,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 103,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SearchPage(
                          products: products,
                        ));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: KWC,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          blurStyle: BlurStyle.solid,
                          color: Color(0x2F000000),
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC3C3C3),
                            size: 28,
                          ),
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Color(0xffC3C3C3),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
