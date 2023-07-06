import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/bag_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/bag/cubit/bag_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit(this._bagUseCase) : super(BagState.initial());

  final BagUseCase _bagUseCase;

  void init() async {
    try {
      final bag = await _bagUseCase.getUserShoppingBag();

      final totlaPrice =
          bag.fold(0.0, (double previousValue, BagModel element) {
        double price =
            previousValue + (element.product.price * element.quantity);
        return price;
      });

      emit(state.copyWith(
        bag: bag,
        totalPrice: totlaPrice,
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
}
