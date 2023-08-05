class ItemModel {
  final String imagePath;
  final String name;
  final double star;
  final String price;
  final String category;
  final String description;
  String? ProductID;
  String? get pID => ProductID; //The getter for pID

  ItemModel({
    required this.star,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.description,
    this.ProductID,
  });
}
