// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

// Model class representing a category
class CategorieModel {
  final String id;
  final String name;

  // Constructor for creating a CategorieModel instance
  CategorieModel({
    required this.id,
    required this.name,
  });

  // Factory method for creating a CategorieModel instance from a QueryDocumentSnapshot
  factory CategorieModel.fromMap(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    return CategorieModel(
      id: doc.id,
      name: map['name'] as String,
    );
  }
}
