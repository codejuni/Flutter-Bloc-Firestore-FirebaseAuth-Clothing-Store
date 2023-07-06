// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';

class HomeState extends Equatable {
  final List<ProductModel> totalProducts;
  final List<ProductModel> products;
  final List<CategorieModel> categories;
  final UserModel user;
  final ScreenStatus status;
  final int indexCategorie;
  final ExceptionModel exception;

  const HomeState({
    required this.totalProducts,
    required this.products,
    required this.categories,
    required this.user,
    required this.status,
    required this.exception,
    required this.indexCategorie,
  });

  factory HomeState.initial() {
    return HomeState(
      totalProducts: const [],
      products: const [],
      categories: const [],
      user: UserModel.initial(),
      status: ScreenStatus.loading,
      exception: ExceptionModel.initial(),
      indexCategorie: 0,
    );
  }

  @override
  List<Object?> get props => [
        totalProducts,
        products,
        categories,
        user,
        status,
        exception,
        indexCategorie,
      ];

  HomeState copyWith({
    List<ProductModel>? totalProducts,
    List<ProductModel>? products,
    List<CategorieModel>? categories,
    UserModel? user,
    ScreenStatus? status,
    ExceptionModel? exception,
    int? indexCategorie,
  }) {
    return HomeState(
      totalProducts: totalProducts ?? this.totalProducts,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      user: user ?? this.user,
      status: status ?? this.status,
      exception: exception ?? this.exception,
      indexCategorie: indexCategorie ?? this.indexCategorie,
    );
  }
}
