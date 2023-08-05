import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:e_commerce/features/users/end_user/home/presentation/product/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/item_model.dart';

class ProductViewPage extends StatelessWidget {
  final ItemModel item;

  const ProductViewPage({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAILS"),
        backgroundColor: KMC,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defultSize! * 3.5),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: SizeConfig.defultSize! * 40,
                  height: SizeConfig.defultSize! * 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item.imagePath,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const VerticalSpace(2.5),
              const Text(
                'Product Details :',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const VerticalSpace(1),
              Row(
                children: [
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: KGC,
                  ),
                  const HorizintalSpace(.2),
                  Text(
                    'Name : ${item.name}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(1),
              Row(
                children: [
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: KGC,
                  ),
                  const HorizintalSpace(.2),
                  Text(
                    'Price : ${item.price}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(1),
              Row(
                children: [
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: KGC,
                  ),
                  const HorizintalSpace(.2),
                  Text(
                    'Category : ${item.category}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(1),
              Row(
                children: [
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: KGC,
                  ),
                  Container(
                    child: Text(
                      'Description : ${item.description}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const HorizintalSpace(.2),
                ],
              ),
              const VerticalSpace(2.5),
              Center(
                child: RatingBar.builder(
                  initialRating: item.star <= 5 ? item.star : 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: const Color(0xffA6A1A1),
                  itemCount: 5,
                  itemSize: SizeConfig.defultSize! * 3.5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color(0xffFFB238),
                  ),
                  onRatingUpdate: (rating) {},
                  updateOnDrag: true,
                ),
              ),
              const VerticalSpace(2.5),
              CustomGeneralButton(
                buttonTitle: "Add to Cart".toUpperCase(),
                onTap: () {
                  ShoppingCartPage.addToCart(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: KMC,
                      content: Text('Item added to cart'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
