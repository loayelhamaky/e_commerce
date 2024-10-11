import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/login_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginWithFacebook implements LoginFactory {
  @override
  Future<void> login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    try {
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(userCredential.user?.email ?? 'no email for facebook login');
        print(userCredential.credential?.accessToken ??
            'no access token for facebook login');
      } else {
        print('Facebook login failed: ${result.message}');
        throw (result.message.toString());
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
