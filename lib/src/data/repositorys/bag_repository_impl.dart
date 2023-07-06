import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/bag_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/bag_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _users = 'Users';

class BagRepositoryImpl extends BagRepositoryInterface {
  @override
  Future<void> addToBag(BagRequest request) async {
    final bagSnapshot = await FirebaseFirestore.instance
        .collection(_users)
        .doc(request.token)
        .get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);
    currentBag.add(request.toMap());
    await bagSnapshot.reference.update({'bag': currentBag});
  }

  @override
  Future<List<BagModel>> getUserShoppingBag(String token) async {
    final bagSnapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);

    List<BagModel> bagList = [];

    for (var item in currentBag) {
      final productRef = await item['idProduct'].get();
      ProductModel product = ProductModel.fromDoc(productRef);
      bagList.add(
        BagModel(
          product: product,
          color: item['color'],
          size: item['size'],
          quantity: item['quantity'],
        ),
      );
    }

    return bagList;
  }

  @override
  Future<void> removeFromBag(String token, int index) async {
    final bagSnapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);

    if (index >= 0 && index < currentBag.length) {
      currentBag.removeAt(index);
      await bagSnapshot.reference.update({'bag': currentBag});
    }
  }
}
