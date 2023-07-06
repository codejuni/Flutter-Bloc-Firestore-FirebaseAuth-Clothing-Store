import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/bag_request.dart';

abstract class BagRepositoryInterface {
  Future<void> addToBag(BagRequest request);
  Future<List<BagModel>> getUserShoppingBag(String token);
  Future<void> removeFromBag(String token, int index);
}
