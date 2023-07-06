import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/product_repository.dart';

// Use case class for product operations
class ProductUseCase {
  final ProductRepositoryInterface _productRepositoryInterface;

  // Constructor for creating a ProductUseCase instance
  ProductUseCase(this._productRepositoryInterface);

  // Get the list of products
  Future<List<ProductModel>> getProducts() async {
    return await _productRepositoryInterface.getProducts();
  }

  // Get the list of products matching the search query
  Future<List<ProductModel>> getSearchProducts(String query) async {
    return await _productRepositoryInterface.getSearchProducts(query);
  }
}
