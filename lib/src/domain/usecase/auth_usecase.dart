import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/auth_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';

// Use case class for authentication operations
class AuthUseCase {
  final AuthRepositoryInterface _authRepositoryInterface;
  final LocalRepositoryInterface _localRepositoryInterface;

  // Constructor for creating an AuthUseCase instance
  AuthUseCase(
    this._authRepositoryInterface,
    this._localRepositoryInterface,
  );

  // Get the user information from a token
  Future<UserModel> getUserFromToken() async {
    final String token = await _localRepositoryInterface.getTokenUser();
    if (token.isEmpty) {
      return UserModel.initial();
    } else {
      UserModel user = await _authRepositoryInterface.getUserFromToken(token);
      final newData = user.copyWith(token: token);
      return newData;
    }
  }

  // Sign in with an email and password
  Future<void> signIn(String email, String password) async {
    String token = await _authRepositoryInterface.signIn(email, password);
    await _localRepositoryInterface.setTokenUser(token);
  }

  // Sign out the user
  Future<void> signOut() async {
    await _authRepositoryInterface.signOut();
    await _localRepositoryInterface.signOut();
  }

  // Sign up with user registration information
  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPass,
    required String name,
    required String surname,
  }) async {
    final request = UserRequest(
        email: email, surname: surname, name: name, password: password);
    String token = await _authRepositoryInterface.signUp(request);
    _localRepositoryInterface.setTokenUser(token);
  }
}
