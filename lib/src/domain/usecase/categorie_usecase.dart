import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/categorie_repository.dart';

// Use case class for category operations
class CategorieUseCase {
  final CategorieRepositoryInterface _categorieRepositoryInterface;

  // Constructor for creating a CategorieUseCase instance
  CategorieUseCase(this._categorieRepositoryInterface);

  // Get the list of categories
  Future<List<CategorieModel>> getCategorie() async {
    return await _categorieRepositoryInterface.getCategorys();
  }
}
