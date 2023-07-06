import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/bag_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/bag_request.dart';

class BagUseCase {
  BagUseCase(
    this._bagRepositoryInterface,
    this._localRepositoryInterface,
  );

  final BagRepositoryInterface _bagRepositoryInterface;
  final LocalRepositoryInterface _localRepositoryInterface;

  Future<List<BagModel>> getUserShoppingBag() async {
    String token = await _localRepositoryInterface.getTokenUser();
    final bag = await _bagRepositoryInterface.getUserShoppingBag(token);
    return bag;
  }

  Future<void> addToBag(int size, int color, String idProduct) async {
    final token = await _localRepositoryInterface.getTokenUser();
    final request = BagRequest(
      idProduct: idProduct,
      size: size,
      color: color,
      token: token,
    );
    await _bagRepositoryInterface.addToBag(request);
  }
}
