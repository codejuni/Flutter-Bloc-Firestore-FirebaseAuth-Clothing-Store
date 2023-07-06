import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/auth_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Constant representing the name of the "Users" collection in Firebase Firestore
const String _users = 'Users';

// Implementation of the AuthRepositoryInterface
class AuthRepositoryImpl extends AuthRepositoryInterface {
  // Get a UserModel from a user token
  @override
  Future<UserModel> getUserFromToken(String token) async {
    // Retrieve the document corresponding to the user token from Firebase Firestore
    final snapshot =
        await FirebaseFirestore.instance.collection(_users).doc(token).get();
    // Create an instance of UserModel from the document data
    final user = UserModel.fromMap(snapshot);
    return user;
  }

  // Sign in with the provided email and password
  @override
  Future<String> signIn(String email, String password) async {
    // Use FirebaseAuth to sign in with the email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Get the token (uid) of the authenticated user
    String token = userCredential.user!.uid;
    return token;
  }

  // Sign out
  @override
  Future<void> signOut() async {
    // Use FirebaseAuth to sign out
    await FirebaseAuth.instance.signOut();
  }

  // Sign up a new user with the provided data
  @override
  Future<String> signUp(UserRequest request) async {
    // Use FirebaseAuth to create a new user with the provided email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    // Get the token (uid) of the newly registered user
    String token = userCredential.user!.uid;

    // Save the user data to Firebase Firestore using the token as the document identifier
    FirebaseFirestore.instance
        .collection(_users)
        .doc(token)
        .set(request.toMap());

    return token;
  }
}
