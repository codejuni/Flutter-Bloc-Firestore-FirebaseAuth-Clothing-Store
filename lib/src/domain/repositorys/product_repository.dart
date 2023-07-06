import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

abstract class ProductRepositoryInterface {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getSearchProducts(String query);
}
