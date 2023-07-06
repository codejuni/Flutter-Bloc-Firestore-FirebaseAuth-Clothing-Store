import 'package:clothing_store_firestore_crud/src/domain/models/user_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/auth_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/request/user_request.dart';

class AuthUseCase {
  AuthUseCase(
    this._authRepositoryInterface,
    this._localRepositoryInterface,
  );
  final AuthRepositoryInterface _authRepositoryInterface;
  final LocalRepositoryInterface _localRepositoryInterface;

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

  Future<void> signIn(String email, String password) async {
    String token = await _authRepositoryInterface.signIn(email, password);
    await _localRepositoryInterface.setTokenUser(token);
  }

  Future<void> signOut() async {
    await _authRepositoryInterface.signOut();
    await _localRepositoryInterface.signOut();
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPass,
    required String name,
    required String surname,
  }) async {
    if (password == confirmPass) {
      final request = UserRequest(
        email: email,
        surname: surname,
        name: name,
        password: password,
      );
      await _authRepositoryInterface.signUp(request);
    }
  }
}
