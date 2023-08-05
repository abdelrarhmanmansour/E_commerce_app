import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/item_model.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});
  static List<ItemModel> favouritesItems = [];

  static void addToFavourite(ItemModel item) {
    favouritesItems.add(item);
  }

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: FavouritesPage.favouritesItems.length,
        itemBuilder: (context, index) {
          ItemModel item = FavouritesPage.favouritesItems[index];
          return ListTile(
            leading: Container(
              width: SizeConfig.defultSize! * 7,
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
            title: Text(item.name),
            subtitle: Text("Price: ${item.price}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  FavouritesPage.favouritesItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
