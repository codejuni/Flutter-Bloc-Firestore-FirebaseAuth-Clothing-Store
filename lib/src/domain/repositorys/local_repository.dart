// Interface defining the contract for a local repository
abstract class LocalRepositoryInterface {
  // Get the user's token from local storage
  Future<String> getTokenUser();

  // Set the user's token in local storage
  Future<void> setTokenUser(String token);

  // Sign out the user
  Future<void> signOut();
}
