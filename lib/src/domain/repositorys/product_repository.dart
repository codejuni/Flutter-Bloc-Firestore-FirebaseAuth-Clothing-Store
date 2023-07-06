import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

// Interface defining the contract for a product repository
abstract class ProductRepositoryInterface {
  // Get the list of products
  Future<List<ProductModel>> getProducts();

  // Get the list of products matching the search query
  Future<List<ProductModel>> getSearchProducts(String query);
}
