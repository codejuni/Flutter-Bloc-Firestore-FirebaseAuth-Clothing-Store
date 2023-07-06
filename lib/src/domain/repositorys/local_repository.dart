abstract class LocalRepositoryInterface {
  Future<String> getTokenUser();
  Future<void> setTokenUser(String token);
  Future<void> signOut();
}
