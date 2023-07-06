import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

class ProductsState extends Equatable {
  final String query;
  final List<ProductModel> products;
  final ScreenStatus status;
  final ExceptionModel exception;
  const ProductsState({
    required this.query,
    required this.products,
    required this.status,
    required this.exception,
  });

  factory ProductsState.initial() {
    return ProductsState(
      query: '',
      products: const [],
      status: ScreenStatus.loading,
      exception: ExceptionModel.initial(),
    );
  }

  @override
  List<Object?> get props => [products, status, exception, query];

  ProductsState copyWith({
    List<ProductModel>? products,
    ScreenStatus? status,
    ExceptionModel? exception,
    String? query,
  }) {
    return ProductsState(
      query: query ?? this.query,
      products: products ?? this.products,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
