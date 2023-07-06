// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategorieModel {
  final String id;
  final String name;
  CategorieModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory CategorieModel.fromMap(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final map = doc.data();
    return CategorieModel(
      id: doc.id,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
