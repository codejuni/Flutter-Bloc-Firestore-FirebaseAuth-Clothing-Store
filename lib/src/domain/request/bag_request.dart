// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// Model class representing a bag request
class BagRequest {
  final String token;
  final String idProduct;
  final int size;
  final int color;

  // Constructor for creating a BagRequest instance
  BagRequest({
    required this.token,
    required this.idProduct,
    required this.size,
    required this.color,
  });

  // Convert BagRequest instance to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduct':
          FirebaseFirestore.instance.collection('Products').doc(idProduct),
      'size': size,
      'color': color,
      'quantity': 1,
    };
  }

  // Convert BagRequest instance to a JSON string
  String toJson() => json.encode(toMap());
}
