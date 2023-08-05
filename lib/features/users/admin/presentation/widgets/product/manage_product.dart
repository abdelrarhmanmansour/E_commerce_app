import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/item_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../auth/firebase/store_data.dart';
import 'edit_product.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({Key? key}) : super(key: key);

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ItemModel> products = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as Map<String, dynamic>;
              products.add(ItemModel(
                name: data[KProductName],
                description: data[KProductDescription],
                imagePath: data[KProductLocation],
                price: data[KProductPrice],
                category: data[KProductCategory],
                star: data[KProductStar].toDouble(),
                ProductID: doc.id,
              ));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTapUp: (details) {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.height - dy;

                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                      items: [
                        MyPopupMenuItem(
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProduct(products: products),
                                settings:
                                    RouteSettings(arguments: products[index]),
                              ),
                            );
                          },
                          child: const Text("Edit"),
                        ),
                        MyPopupMenuItem(
                          onClick: () {
                            _store.deleteProduct(products[index].ProductID);
                            Navigator.pop(context);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                  child: Stack(
                    children: [
                      products[index].imagePath != null
                          ? Positioned.fill(
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(products[index].imagePath!),
                              ),
                            )
                          : Container(),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            color: KWC,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(products[index].name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('\$ ${products[index].price}')
                                  ]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: products.length,
            );
          } else {
            return const Center(child: Text("Loading ...."));
          }
        },
      ),
    );
  }
}

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Function onClick;
  final Widget child;
  MyPopupMenuItem({
    required this.child,
    required this.onClick,
  }) : super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState<T>();
  }
}

class MyPopupMenuItemState<T>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}
