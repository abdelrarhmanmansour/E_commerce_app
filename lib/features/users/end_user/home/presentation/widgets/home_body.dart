import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/item_model.dart';
import 'package:flutter/material.dart';
import '../../../../../../vegetables_tab.dart';
import '../product/shopping_cart_page.dart';
import '../../../../../../developed_by.dart';
import '../../../../../auth/firebase/store_data.dart';
import '../dry_fruits/dry_fruits_tab.dart';
import '../fruits/fruits_tab.dart';
import '../product/favourites_product_page.dart';
import 'custom_appbar.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

int currentIndex = 0;
bool showTabBar = true;

class _HomePageBodyState extends State<HomePageBody> {
  final store = Store();
  List<ItemModel> _products = [];

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KWC,
          toolbarHeight: 140,
          flexibleSpace: CustomAppBar(products: _products),
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: showTabBar
              ? TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  unselectedLabelColor: const Color(0xff989898),
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffCC7D00),
                  ),
                  tabs: const [
                    Tab(text: 'Vegetables'),
                    Tab(text: 'Fruits'),
                    Tab(text: 'Dry Fruits'),
                  ],
                )
              : null,
        ),
        body: IndexedStack(
          index: currentIndex,
          children: [
            TabBarView(
              children: [
                VegetablesTab(_products),
                FruitsTab(_products),
                DryFruitsTab(_products),
              ],
            ),
            ShoppingCartPage(),
            FavouritesPage(),
            const DeveloperPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: KMC,
          backgroundColor: KWC,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: KGC,
          currentIndex: currentIndex,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
              showTabBar = index == 0;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 36,
                color: KGC,
              ),
              activeIcon: Icon(
                Icons.home_outlined,
                size: 40,
                color: KMC,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 36,
                color: KGC,
              ),
              activeIcon: Icon(
                Icons.shopping_cart_outlined,
                size: 40,
                color: KMC,
              ),
              label: "Shopping cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                size: 36,
                color: KGC,
              ),
              activeIcon: Icon(
                Icons.favorite_border_rounded,
                size: 40,
                color: KMC,
              ),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_sharp,
                size: 36,
                color: KGC,
              ),
              activeIcon: Icon(
                Icons.person_outline_sharp,
                size: 40,
                color: KMC,
              ),
              label: "Developed By",
            ),
          ],
        ),
      ),
    );
  }

  void getProduct() {
    store.loadProducts().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        List<ItemModel> products = [];
        for (var doc in snapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          products.add(ItemModel(
            name: data[KProductName],
            description: data[KProductDescription],
            imagePath: data[KProductLocation],
            price: data[KProductPrice],
            category: data[KProductCategory],
            star: data[KProductStar].toDouble(),
          ));
        }
        setState(() {
          _products = products;
        });
      } else {
        print("No data available");
      }
    });
  }
}
