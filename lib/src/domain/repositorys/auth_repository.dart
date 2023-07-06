import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';

// Interface defining the contract for an authentication repository
abstract class AuthRepositoryInterface {
  // Get the user information from a token
  Future<UserModel> getUserFromToken(String token);

  // Sign in with an email and password
  Future<String> signIn(String email, String password);

  // Sign up with user registration information
  Future<String> signUp(UserRequest request);

  // Sign out the user
  Future<void> signOut();
}
