import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';

abstract class CategorieRepositoryInterface {
  Future<List<CategorieModel>> getCategorys();
}
