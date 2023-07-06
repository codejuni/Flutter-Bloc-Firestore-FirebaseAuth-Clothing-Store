import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/categorie_usecase.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/product_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._authUseCase,
    this._categorieUseCase,
    this._productUseCase,
  ) : super(HomeState.initial());

  final AuthUseCase _authUseCase;
  final ProductUseCase _productUseCase;
  final CategorieUseCase _categorieUseCase;

  void init() async {
    emit(state.copyWith(status: ScreenStatus.loading));

    try {
      final totalProducts = await _productUseCase.getProducts();
      final categories = await _categorieUseCase.getCategorie();
      final user = await _authUseCase.getUserFromToken();
      final products = state.indexCategorie == 0
          ? totalProducts
          : totalProducts
              .where((element) =>
                  element.categorie == categories[state.indexCategorie - 1].id)
              .toList();

      emit(state.copyWith(
        totalProducts: totalProducts,
        products: products,
        categories: categories,
        user: user,
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
    } catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error',
          message: e.toString(),
        ),
      ));
    }
  }

  void changeIndexCategorie(int index) {
    final products = index == 0
        ? state.totalProducts
        : state.totalProducts
            .where((element) =>
                element.categorie == state.categories[index - 1].id)
            .toList();
    emit(state.copyWith(indexCategorie: index, products: products));
  }

  void changeStatus() {
    emit(state.copyWith(status: ScreenStatus.success));
  }
}
