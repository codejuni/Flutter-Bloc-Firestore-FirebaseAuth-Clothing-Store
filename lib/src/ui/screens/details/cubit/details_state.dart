// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

class DetailsState extends Equatable {
  final ProductModel product;
  final int size;
  final int color;
  final ScreenStatus status;
  final int indexImage;
  final ExceptionModel exception;

  const DetailsState({
    required this.product,
    required this.size,
    required this.color,
    required this.status,
    required this.indexImage,
    required this.exception,
  });

  factory DetailsState.initial() {
    return DetailsState(
      product: ProductModel.initial(),
      size: 0,
      color: 0,
      status: ScreenStatus.initial,
      indexImage: 0,
      exception: ExceptionModel.initial(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        product,
        color,
        size,
        status,
        indexImage,
        exception,
      ];

  DetailsState copyWith({
    ProductModel? product,
    int? size,
    ScreenStatus? status,
    int? color,
    int? indexImage,
    ExceptionModel? exception,
  }) {
    return DetailsState(
      product: product ?? this.product,
      size: size ?? this.size,
      status: status ?? this.status,
      color: color ?? this.color,
      indexImage: indexImage ?? this.indexImage,
      exception: exception ?? this.exception,
    );
  }
}
