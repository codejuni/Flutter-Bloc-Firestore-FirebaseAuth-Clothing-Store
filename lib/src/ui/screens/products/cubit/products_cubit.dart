import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/product_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/cubit/products_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productUseCase) : super(ProductsState.initial());

  final ProductUseCase _productUseCase;

  void init(String query) async {
    try {
      final products = await _productUseCase.getSearchProducts(query);
      emit(state.copyWith(
        query: query,
        products: products,
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
}
