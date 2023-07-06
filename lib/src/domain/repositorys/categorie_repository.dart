import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';

// Interface defining the contract for a category repository
abstract class CategorieRepositoryInterface {
  // Get the list of categories
  Future<List<CategorieModel>> getCategorys();
}
