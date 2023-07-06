// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

// Model class representing an item in the shopping bag
class BagModel {
  final ProductModel product;
  final int color;
  final int size;
  final int quantity;

  // Constructor for creating a BagModel instance
  BagModel({
    required this.product,
    required this.color,
    required this.size,
    required this.quantity,
  });
}
