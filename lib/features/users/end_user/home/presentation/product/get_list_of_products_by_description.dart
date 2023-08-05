import '../../../../../../core/widgets/item_model.dart';

List<ItemModel> getListByDescription(
    List<ItemModel> products, String description) {
  List<ItemModel> filteredList = [];

  for (var product in products) {
    if (product.description == description) {
      filteredList.add(product);
    }
  }

  return filteredList;
}
