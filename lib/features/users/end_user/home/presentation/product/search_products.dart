import 'package:e_commerce/core/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/item_model.dart';
import 'product_view_page.dart';

class SearchPage extends StatefulWidget {
  final List<ItemModel> products;

  const SearchPage({Key? key, required this.products}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<ItemModel> _searchResults = [];

  void _performSearch() {
    if (_searchQuery.isEmpty) {
      setState(() {
        _searchResults = [];
      });
    } else {
      setState(() {
        _searchResults = widget.products
            .where((product) =>
                product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
      });
    }
  }

  Future<void> _navigateToProductViewPage(ItemModel product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductViewPage(item: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KMC,
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
              _performSearch();
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search ....',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final product = _searchResults[index];
          return ListTile(
            title: Text(product.name),
            onTap: () {
              _navigateToProductViewPage(product);
            },
          );
        },
      ),
    );
  }
}
