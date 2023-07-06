import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/categorie_repository.dart';

class CategorieUseCase {
  CategorieUseCase(this._categorieRepositoryInterface);
  final CategorieRepositoryInterface _categorieRepositoryInterface;

  Future<List<CategorieModel>> getCategorie() async {
    return await _categorieRepositoryInterface.getCategorys();
  }
}
