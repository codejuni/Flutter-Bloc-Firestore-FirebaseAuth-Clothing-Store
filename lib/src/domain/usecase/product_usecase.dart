import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/product_repository.dart';

class ProductUseCase {
  ProductUseCase(this._productRepositoryInterface);
  final ProductRepositoryInterface _productRepositoryInterface;

  Future<List<ProductModel>> getProducts() async {
    return await _productRepositoryInterface.getProducts();
  }

  Future<List<ProductModel>> getSearchProducts(String query) async {
    return await _productRepositoryInterface.getSearchProducts(query);
  }
}
