import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/widgets/item_model.dart';

import '../../../../../../core/utils/size_config.dart';

class ShoppingCartPage extends StatefulWidget {
  static List<ItemModel> cartItems = [];

  static void addToCart(ItemModel item) {
    cartItems.add(item);
  }

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<int> quantities = []; // Store individual quantities for each item

  @override
  Widget build(BuildContext context) {
    // Initialize quantities if it's empty or has different length than cartItems
    if (quantities.isEmpty ||
        quantities.length != ShoppingCartPage.cartItems.length) {
      quantities =
          List<int>.generate(ShoppingCartPage.cartItems.length, (index) => 1);
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: ShoppingCartPage.cartItems.length,
        itemBuilder: (context, index) {
          ItemModel item = ShoppingCartPage.cartItems[index];

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
            title:
                Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text("Price: ${item.price}",
                maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Container(
              width: SizeConfig.screenWidth! / 2.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        subtract(index); // Pass the index to subtract method
                        if (quantities[index] == 0) {
                          ShoppingCartPage.cartItems.removeAt(index);
                          quantities.removeAt(index);
                        }
                      });
                    },
                    icon: const Icon(Icons.remove_circle_outlined),
                  ),
                  Text(
                    quantities[index].toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        add(index); // Pass the index to add method
                      });
                    },
                    icon: const Icon(Icons.add_circle_outlined),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(flex: 2),
          Text(
            'Total: \$${calculateTotal().toStringAsFixed(2)}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: SizeConfig.defultSize! * 8,
              width: SizeConfig.defultSize! * 13.5,
              child: CustomGeneralButton(
                buttonTitle: "Checkout",
                onTap: () {},
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  void subtract(int index) {
    if (quantities[index] > 0) {
      setState(() {
        quantities[index]--;
      });
    }
  }

  void add(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  double calculateTotal() {
    double total = 0;

    for (int i = 0; i < ShoppingCartPage.cartItems.length; i++) {
      ItemModel item = ShoppingCartPage.cartItems[i];
      int quantity = quantities[i];
      total += int.parse(item.price.substring(0, 3)) * quantity;
    }

    return total;
  }
}
