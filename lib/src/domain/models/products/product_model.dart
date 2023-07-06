// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/models/products/product_color_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Model class representing a product
class ProductModel {
  final String? id;
  final String name;
  final String categorie;
  final double price;
  final List<ProductColorModel> colors;

  // Constructor for creating a ProductModel instance
  ProductModel({
    this.id,
    required this.name,
    required this.categorie,
    required this.price,
    required this.colors,
  });

  // Factory method for creating a ProductModel instance from a QueryDocumentSnapshot
  factory ProductModel.fromMap(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();

    return ProductModel(
      id: doc.id,
      name: map['name'] as String,
      categorie: map['categorie'] as String,
      price: map['price'] as double,
      colors: (map['colors'] as List)
          .map((e) => ProductColorModel.fromMap(e))
          .toList(),
    );
  }

  // Factory method for creating a ProductModel instance from a DocumentSnapshot
  factory ProductModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data()!;

    return ProductModel(
      id: doc.id,
      name: map['name'] as String,
      categorie: map['categorie'] as String,
      price: map['price'] as double,
      colors: (map['colors'] as List)
          .map((e) => ProductColorModel.fromMap(e))
          .toList(),
    );
  }

  // Factory method for creating an initial empty ProductModel instance
  factory ProductModel.initial() {
    return ProductModel(
      id: '',
      name: '',
      categorie: '',
      price: 0,
      colors: [],
    );
  }
}
