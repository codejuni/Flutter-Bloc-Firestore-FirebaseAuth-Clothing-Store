import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/delete_item_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/bag_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/bag/cubit/bag_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit(this._bagUseCase) : super(BagState.initial());

  final BagUseCase _bagUseCase;

  /// Initialize the bag state by fetching the user's shopping bag and calculating the total price.
  void init() async {
    try {
      final bag = await _bagUseCase.getUserShoppingBag();

      final totalPrice =
          bag.fold(0.0, (double previousValue, BagModel element) {
        double price =
            previousValue + (element.product.price * element.quantity);
        return price;
      });

      emit(state.copyWith(
        bag: bag,
        totalPrice: totalPrice,
        status: ScreenStatus.success,
      ));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error',
          message: e.message.toString(),
        ),
      ));
    }
  }

  /// Remove an item from the bag based on the provided index.
  void removeFromBag(int index) async {
    emit(state.copyWith(removeStatus: RemoveFromBagStatus.success));
    try {
      await _bagUseCase.removeFromBag(index);

      final bagList = state.bag;
      bagList.removeAt(index);

      emit(state.copyWith(
        removeStatus: RemoveFromBagStatus.success,
        exception: ExceptionModel(
          title: 'Success!',
          message: 'A product has been removed from your shopping bag',
        ),
        bag: bagList,
      ));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        removeStatus: RemoveFromBagStatus.error,
        exception: ExceptionModel(
          title: 'Error!',
          message: e.message.toString(),
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        removeStatus: RemoveFromBagStatus.error,
        exception: ExceptionModel(
          title: 'Error!',
          message: e.toString(),
        ),
      ));
    }
  }

  /// Change the remove status back to the initial state.
  void changeRemoveStatus() {
    emit(state.copyWith(removeStatus: RemoveFromBagStatus.initial));
  }
}
