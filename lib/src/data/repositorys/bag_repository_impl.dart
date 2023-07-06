import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/bag_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/bag_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Constant representing the name of the "Users" collection in Firebase Firestore
const String _users = 'Users';

// Implementation of the BagRepositoryInterface
class BagRepositoryImpl extends BagRepositoryInterface {
  // Add an item to the user's shopping bag
  @override
  Future<void> addToBag(BagRequest request) async {
    // Retrieve the bag document for the user from Firebase Firestore
    final bagSnapshot = await FirebaseFirestore.instance
        .collection(_users)
        .doc(request.token)
        .get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);
    // Add the item to the current bag list
    currentBag.add(request.toMap());
    // Update the bag document in Firebase Firestore with the updated bag list
    await bagSnapshot.reference.update({'bag': currentBag});
  }

  // Get the user's shopping bag
  @override
  Future<List<BagModel>> getUserShoppingBag(String token) async {
    // Retrieve the bag document for the user from Firebase Firestore
    final bagSnapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);

    List<BagModel> bagList = [];

    // Iterate over the current bag list
    for (var item in currentBag) {
      // Retrieve the product reference for each item in the bag
      final productRef = await item['idProduct'].get();
      // Create a ProductModel from the product reference
      ProductModel product = ProductModel.fromDoc(productRef);
      // Create a BagModel with the corresponding data and add it to the bagList
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

  // Remove an item from the user's shopping bag
  @override
  Future<void> removeFromBag(String token, int index) async {
    // Retrieve the bag document for the user from Firebase Firestore
    final bagSnapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    final bagData = bagSnapshot.data();
    final bag = bagData!['bag'];
    final List<Map<String, dynamic>> currentBag =
        List<Map<String, dynamic>>.from(bag);

    if (index >= 0 && index < currentBag.length) {
      // Remove the item at the specified index from the current bag list
      currentBag.removeAt(index);
      // Update the bag document in Firebase Firestore with the updated bag list
      await bagSnapshot.reference.update({'bag': currentBag});
    }
  }
}
