import 'package:flutter/material.dart';
import '../../../../../../../core/constants.dart';
import '../../../../../../../core/widgets/item_model.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_caption.dart';
import '../../../../../../core/widgets/horizontal_scroll.dart';
import '../../../../../../core/widgets/space_widget.dart';
import '../product/get_list_of_products_by_description.dart';

class DryFruitsTab extends StatelessWidget {
  final List<ItemModel> products;

  const DryFruitsTab(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> indehiscentDryFruits =
        getListByDescription(products, KIndehiscentDryFruits);
    List<ItemModel> mixedDryFruitsPack =
        getListByDescription(products, KMixedDryFruitsPack);
    List<ItemModel> dehiscentDryFruits =
        getListByDescription(products, KDehiscentDryFruits);
    List<ItemModel> kshmiriDryFruits =
        getListByDescription(products, KKashmiriDryFruits);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomCaption(
            mainCaption: "indehiscent Dry Fruits",
            sale: "(20% Off)",
            subCaption: "Pick up from organic farms",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: indehiscentDryFruits[index]),
              itemCount: indehiscentDryFruits.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "mixed Dry Fruits Pack",
            sale: "(10% Off)",
            subCaption: "Fruit mix fresh pack",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: mixedDryFruitsPack[index]),
              itemCount: mixedDryFruitsPack.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "Dehiscent Dry Fruits",
            sale: "(15% Off)",
            subCaption: "Fresh Dehiscent Dry Fruits",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: dehiscentDryFruits[index]),
              itemCount: dehiscentDryFruits.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
          const CustomCaption(
            mainCaption: "kshmiri Dry Fruits",
            sale: "(5% Off)",
            subCaption: "Fresh Kashmiri Dry Fruits",
          ),
          Container(
            height: SizeConfig.defultSize! * 26,
            color: KWC,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HorizontalScroll(items: kshmiriDryFruits[index]),
              itemCount: kshmiriDryFruits.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const VerticalSpace(1),
        ],
      ),
    );
  }
}
