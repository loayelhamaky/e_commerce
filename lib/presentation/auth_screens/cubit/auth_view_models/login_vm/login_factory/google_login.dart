import 'package:e_commerce_app/data/shared_prefs_utils/shared_prefs_utils.dart';
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/login_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle implements LoginFactory {
  @override
  Future<void> login() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (googleAuth.accessToken != null) {
        SharedPrefsUtils.saveFirebaseToken(googleAuth.accessToken!);
      } else {
        throw Exception('firebase google access token is null');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
