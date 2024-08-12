abstract class AuthRepo {
  Future login(String email, String password);
  Future register(String email, String password,String userName, String mobileNum);
}