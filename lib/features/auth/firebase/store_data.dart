import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/item_model.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(ItemModel item) {
    _firestore.collection(KItemCollection).add({
      KProductName: item.name,
      KProductPrice: item.price,
      KProductLocation: item.imagePath,
      KProductStar: item.star,
      KProductCategory: item.category,
      KProductDescription: item.description,
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(KItemCollection).snapshots();
  }

  Stream<DocumentSnapshot> loadOrderDetails(documentId) {
    return _firestore.collection(KItemCollection).doc(documentId).snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(KItemCollection).doc(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore.collection(KItemCollection).doc(documentId).update(data);
  }
}
