import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/categorie_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _categories = 'Categories';

class CategorieRepositoryImpl extends CategorieRepositoryInterface {
  @override
  Future<List<CategorieModel>> getCategorys() async {
    List<CategorieModel> products = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(_categories).get();

    for (var doc in querySnapshot.docs) {
      CategorieModel product = CategorieModel.fromMap(doc);
      products.add(product);
    }

    return products;
  }
}
