import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Constant representing the key for storing the token in SharedPreferences
const String _token = 'token';

// Implementation of the LocalRepositoryInterface
class LocalRepositoryImpl extends LocalRepositoryInterface {
  // Get the user's token from SharedPreferences
  @override
  Future<String> getTokenUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Retrieve the token value from SharedPreferences, or an empty string if it doesn't exist
    String token = preferences.getString(_token) ?? '';
    return token;
  }

  // Set the user's token in SharedPreferences
  @override
  Future<void> setTokenUser(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Store the token value in SharedPreferences
    preferences.setString(_token, token);
  }

  // Remove the user's token from SharedPreferences
  @override
  Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Remove the token from SharedPreferences
    preferences.remove(_token);
  }
}
