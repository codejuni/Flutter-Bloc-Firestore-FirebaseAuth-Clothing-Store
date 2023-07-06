import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _token = 'token';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<String> getTokenUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(_token) ?? '';
    return token;
  }

  @override
  Future<void> setTokenUser(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_token, token);
  }

  @override
  Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(_token);
  }
}
