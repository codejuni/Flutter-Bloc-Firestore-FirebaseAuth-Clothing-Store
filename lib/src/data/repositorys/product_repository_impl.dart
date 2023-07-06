import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Constant representing the name of the "Products" collection in Firebase Firestore
const String _products = 'Products';

// Implementation of the ProductRepositoryInterface
class ProductRepositoryImpl extends ProductRepositoryInterface {
  // Get the list of products
  @override
  Future<List<ProductModel>> getProducts() async {
    // Create an empty list to store the products
    List<ProductModel> products = [];

    // Retrieve the documents from the "Products" collection in Firebase Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(_products).get();

    // Iterate over the documents and create ProductModel instances for each document
    for (var doc in querySnapshot.docs) {
      ProductModel product = ProductModel.fromMap(doc);
      // Add the product to the list
      products.add(product);
    }

    return products;
  }

  // Get the list of products matching the search query
  @override
  Future<List<ProductModel>> getSearchProducts(String query) async {
    // Retrieve the documents from the "Products" collection in Firebase Firestore
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(_products)
        .where('name', isGreaterThanOrEqualTo: query)
        .get();

    // Map each document to a ProductModel instance and return the list of products
    return snapshot.docs.map((doc) {
      final product = ProductModel.fromMap(
          doc as QueryDocumentSnapshot<Map<String, dynamic>>);
      return product;
    }).toList();
  }
}
