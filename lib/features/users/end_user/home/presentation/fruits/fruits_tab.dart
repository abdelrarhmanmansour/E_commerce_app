import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/constants.dart';
import '../../../../../../../core/widgets/item_model.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_caption.dart';
import '../../../../../../core/widgets/horizontal_scroll.dart';
import '../product/get_list_of_products_by_description.dart';

class FruitsTab extends StatelessWidget {
  final List<ItemModel> products;

  const FruitsTab(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> mixedFruitPack =
        getListByDescription(products, KMixedFruitPack);
    List<ItemModel> organicFruits =
        getListByDescription(products, KOrganicFruits);
    List<ItemModel> stoneFruits = getListByDescription(products, KStoneFruits);
    List<ItemModel> melons = getListByDescription(products, KMelons);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomCaption(
            mainCaption: "Organic Fruits",
            sale: "(20% Off)",
            subCaption: "Pick up from organic farms",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: organicFruits[index]),
              itemCount: organicFruits.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "Mixed Fruit Pack",
            sale: "(10% Off)",
            subCaption: "Fruit mix fresh pack",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: mixedFruitPack[index]),
              itemCount: mixedFruitPack.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "Stone Fruits",
            sale: "(20% Off)",
            subCaption: "Fresh Stone Fruits",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: stoneFruits[index]),
              itemCount: stoneFruits.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "Melons",
            sale: "(5% Off)",
            subCaption: "Fresh Melons Fruits",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: melons[index]),
              itemCount: melons.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
        ],
      ),
    );
  }
}
