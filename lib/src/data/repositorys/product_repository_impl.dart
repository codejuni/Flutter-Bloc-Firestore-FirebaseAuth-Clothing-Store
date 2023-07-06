import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _products = 'Products';

class ProductRepositoryImpl extends ProductRepositoryInterface {
  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(_products).get();

    for (var doc in querySnapshot.docs) {
      ProductModel product = ProductModel.fromMap(doc);
      products.add(product);
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getSearchProducts(String query) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(_products)
        .where('name', isGreaterThanOrEqualTo: query)
        .get();

    return snapshot.docs.map((doc) {
      final product = ProductModel.fromMap(
          doc as QueryDocumentSnapshot<Map<String, dynamic>>);
      return product;
    }).toList();
  }
}
