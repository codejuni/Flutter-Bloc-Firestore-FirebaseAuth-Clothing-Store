import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/bag_request.dart';

// Interface defining the contract for a shopping bag repository
abstract class BagRepositoryInterface {
  // Add an item to the shopping bag
  Future<void> addToBag(BagRequest request);

  // Get the user's shopping bag
  Future<List<BagModel>> getUserShoppingBag(String token);

  // Remove an item from the shopping bag
  Future<void> removeFromBag(String token, int index);
}
