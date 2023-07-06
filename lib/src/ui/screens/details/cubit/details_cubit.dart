import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/bag_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._bagUseCase) : super(DetailsState.initial());

  final BagUseCase _bagUseCase;

  PageController pageController = PageController();

  void getProduct(ProductModel product) {
    pageController.addListener(_listener);
    emit(state.copyWith(product: product, indexImage: 0));
  }

  void changeSize(int index) {
    emit(state.copyWith(size: index));
  }

  void changeColor(int index) {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    emit(state.copyWith(color: index, indexImage: 0, size: 0));
  }

  void _listener() {
    double index = pageController.page!;
    emit(state.copyWith(indexImage: index.toInt()));
  }

  void addToBag() async {
    emit(state.copyWith(status: ScreenStatus.loading));
    try {
      await _bagUseCase.addToBag(state.size, state.color, state.product.id!);
      emit(state.copyWith(
        status: ScreenStatus.success,
        exception: ExceptionModel(
          title: 'Success',
          message: 'has been added to your shopping bag',
        ),
      ));
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          status: ScreenStatus.error,
          exception: ExceptionModel(
            title: 'Error',
            message: e.message.toString(),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ScreenStatus.error,
          exception: ExceptionModel(
            title: 'Error',
            message: e.toString(),
          ),
        ),
      );
    }
  }

  void changeStatus() {
    emit(state.copyWith(status: ScreenStatus.initial));
  }
}
