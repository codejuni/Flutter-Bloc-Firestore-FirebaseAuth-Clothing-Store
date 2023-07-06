import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/auth_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String _users = 'Users';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  @override
  Future<UserModel> getUserFromToken(String token) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    final user = UserModel.fromMap(snapshot);
    return user;
  }

  @override
  Future<String> signIn(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    String token = userCredential.user!.uid;
    return token;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<String> signUp(UserRequest request) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    String token = userCredential.user!.uid;

    FirebaseFirestore.instance
        .collection(_users)
        .doc(token)
        .set(request.toMap());

    return token;
  }
}
