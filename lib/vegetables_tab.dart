import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'core/utils/size_config.dart';
import 'core/widgets/custom_caption.dart';
import 'core/widgets/horizontal_scroll.dart';
import 'core/widgets/item_model.dart';
import 'core/widgets/space_widget.dart';
import 'features/users/end_user/home/presentation/product/get_list_of_products_by_description.dart';

class VegetablesTab extends StatelessWidget {
  final List<ItemModel> products;

  const VegetablesTab(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> mixedVegetablesPack =
        getListByDescription(products, KMixedVegetablesPack);
    List<ItemModel> organicVegetables =
        getListByDescription(products, KOrganicVegetables);
    List<ItemModel> alliumVegetables =
        getListByDescription(products, KAlliumVegetabels);
    List<ItemModel> rootVegetables =
        getListByDescription(products, KRootVegetabels);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomCaption(
              mainCaption: "Organic Vegetables",
              sale: "(20% Off)",
              subCaption: "Pick up from organic farms",
            ),
            Container(
              height: SizeConfig.defultSize! * 26,
              color: KWC,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HorizontalScroll(items: organicVegetables[index]),
                itemCount: organicVegetables.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const VerticalSpace(1),
            const CustomCaption(
              mainCaption: "Mixed Vegetables Pack",
              sale: "(10% Off)",
              subCaption: "Vegetable mix fresh pack",
            ),
            Container(
              height: SizeConfig.defultSize! * 26,
              color: KWC,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HorizontalScroll(items: mixedVegetablesPack[index]),
                itemCount: mixedVegetablesPack.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const VerticalSpace(1),
            const CustomCaption(
              mainCaption: "Allium Vegetables",
              sale: "(20% Off)",
              subCaption: "Fresh Allium Vegetables",
            ),
            Container(
              height: SizeConfig.defultSize! * 26,
              color: KWC,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HorizontalScroll(items: alliumVegetables[index]),
                itemCount: alliumVegetables.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const VerticalSpace(1),
            const CustomCaption(
              mainCaption: "Root Vegetables",
              sale: "(5% Off)",
              subCaption: "Fresh Root Vegetables",
            ),
            Container(
              height: SizeConfig.defultSize! * 26,
              color: KWC,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HorizontalScroll(items: rootVegetables[index]),
                itemCount: rootVegetables.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const VerticalSpace(1),
          ],
        ),
      ),
    );
  }
}
