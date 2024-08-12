import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
@singleton
class SharedPrefsUtils{
   Future saveToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
  static Future<String?> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getString("token");
  }
}