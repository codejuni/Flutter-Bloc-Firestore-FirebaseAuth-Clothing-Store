import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';

abstract class AuthRepositoryInterface {
  Future<UserModel> getUserFromToken(String token);
  Future<String> signIn(String email, String password);
  Future<String> signUp(UserRequest request);
  Future<void> signOut();
}
