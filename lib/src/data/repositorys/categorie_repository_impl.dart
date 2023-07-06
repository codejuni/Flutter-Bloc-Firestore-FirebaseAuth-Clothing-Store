import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/categorie_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Constant representing the name of the "Categories" collection in Firebase Firestore
const String _categories = 'Categories';

// Implementation of the CategorieRepositoryInterface
class CategorieRepositoryImpl extends CategorieRepositoryInterface {
  // Get the list of categories
  @override
  Future<List<CategorieModel>> getCategorys() async {
    // Create an empty list to store the categories
    List<CategorieModel> categories = [];

    // Retrieve the documents from the "Categories" collection in Firebase Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(_categories).get();

    // Iterate over the documents and create CategorieModel instances for each document
    for (var doc in querySnapshot.docs) {
      CategorieModel category = CategorieModel.fromMap(doc);
      // Add the category to the list
      categories.add(category);
    }

    return categories;
  }
}
