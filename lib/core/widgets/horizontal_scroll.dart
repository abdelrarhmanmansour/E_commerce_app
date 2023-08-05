import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/item_model.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:e_commerce/features/users/end_user/home/presentation/product/favourites_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../features/users/end_user/home/presentation/product/product_view_page.dart';
import '../utils/size_config.dart';

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll({Key? key, required this.items}) : super(key: key);
  final ItemModel items;

  @override
  State<HorizontalScroll> createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  bool isFavorite = false;
  void _navigateToProductViewPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductViewPage(item: widget.items),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToProductViewPage,
      child: Container(
        width: 140,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: SizeConfig.defultSize! * 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.items.imagePath,
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: KWC,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                              if (isFavorite == true) {
                                FavouritesPage.addToFavourite(widget.items);
                              }
                            });
                          },
                          icon: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Color(0xffF03A16),
                                  size: 25,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: Color(0xffEDCB15),
                                  size: 25,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(1),
              RatingBar.builder(
                initialRating: widget.items.star <= 5 ? widget.items.star : 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: const Color(0xffA6A1A1),
                itemCount: 5,
                itemSize: 16,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xffFFB238),
                ),
                onRatingUpdate: (rating) {},
                updateOnDrag: true,
              ),
              Text(
                widget.items.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF393939),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.items.price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF393939),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
