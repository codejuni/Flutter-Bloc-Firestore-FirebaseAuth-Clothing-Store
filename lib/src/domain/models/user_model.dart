// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

// Model class representing a user
class UserModel {
  final String? token;
  final String name;
  final String surname;
  final String image;
  final String email;

  // Constructor for creating a UserModel instance
  const UserModel({
    this.token,
    required this.name,
    required this.surname,
    required this.image,
    required this.email,
  });

  // Factory method for creating an initial UserModel instance
  factory UserModel.initial() {
    return const UserModel(
      name: 'Guest',
      surname: '',
      image: 'https://cdn-icons-png.flaticon.com/128/599/599305.png',
      email: '',
      token: '',
    );
  }

  // Copy method to create a new UserModel instance with updated properties
  UserModel copyWith({
    String? token,
    String? name,
    String? surname,
    String? image,
    String? email,
  }) {
    return UserModel(
      token: token ?? this.token,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      image: image ?? this.image,
      email: email ?? this.email,
    );
  }

  // Factory method for creating a UserModel instance from a DocumentSnapshot
  factory UserModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data()!;

    return UserModel(
      name: map['name'] as String,
      surname: map['surname'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
    );
  }
}
