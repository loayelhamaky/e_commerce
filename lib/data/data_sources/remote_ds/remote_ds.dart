
abstract class AuthRemoteDs{
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String userName,
      String mobileNum);
}