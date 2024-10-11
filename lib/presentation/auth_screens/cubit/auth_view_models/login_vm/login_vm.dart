import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../domain/interface_repos/auth_repo.dart';
import '../../../../main_screen/view/main_screen_view.dart';
import '../../../register/view.dart';
import '../../auth_state.dart';

/// sorry code is kind of long
@singleton
class LoginVm extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final InternetConnectionChecker internetConnectionChecker;
  bool connectionWasPreviouslyOffline = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;
  String? verificationId;

  LoginVm(this.authRepo, this.internetConnectionChecker) : super(AuthState()) {
    _connectionStreamListener();
  }

  void _connectionStreamListener() {
    _connectionSubscription =
        internetConnectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        connectionWasPreviouslyOffline = true;
        emit(state.copyWith(state: BaseApiState.offline));
      } else if (status == InternetConnectionStatus.connected) {
        emit(state.copyWith(state: BaseApiState.online));
      }
    });
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$')
        .hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> loginWithMailAndPassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(state: BaseApiState.loading));
    try {
      await authRepo.login(
          emailController.text.trim(), passwordController.text.trim());

      // UserCredential userCredential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //         email: emailController.text.trim(),
      //         password: passwordController.text.trim());
      // if (userCredential.user != null) {
      //   emit(state.copyWith(state: BaseApiState.success));
      // }
      emit(state.copyWith(state: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(
          state: BaseApiState.failure, errorMessage: _handleError(e)));
    }
  }

  String _handleError(dynamic e) {
    if (kDebugMode) {
      print('Exception: ${e.runtimeType}');
      print('Exception details: ${e.toString()}');
    }

    if (e is FirebaseAuthException) {
      return _firebaseAuthErrorMessages[e.code] ??
          'Authentication error: ${e.message}';
    }

    return 'An error occurred. Please try again.';
  }

  final Map<String, String> _firebaseAuthErrorMessages = {
    'user-not-found': 'No user found for that email.',
    'wrong-password': 'Wrong password provided for that user.',
    'invalid-email': 'Your email address appears to be malformed.',
    'user-disabled': 'User with this email has been disabled.',
    'too-many-requests': 'Too many requests. Try again later.',
    'operation-not-allowed':
        'Signing in with Email and Password is not enabled.',
  };

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainScreen.routeName);
  }

  void navigateToRegisterScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
  }

  void emptyFields() {
    emailController.text = '';
    passwordController.text = '';
  }

  void loginWithGoogle() async {
    emit(state.copyWith(state: BaseApiState.loading));
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    try {
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
      emit(state.copyWith(state: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(state: BaseApiState.failure));
      print('Error signing in with Google: $e');
    }
  }

  Future<User?> signInWithFacebook() async {
    emit(state.copyWith(state: BaseApiState.loading));
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.email ?? 'no email');
      print(userCredential.credential?.accessToken ?? 'no access token');
      emit(state.copyWith(state: BaseApiState.success));
      return userCredential.user;
    } else {
      print('Facebook login failed: ${result.message}');
      emit(state.copyWith(state: BaseApiState.failure));
      return null;
    }
  }

  void onSmsTap(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter your phone number"),
          content: TextField(
            controller: phoneController,
            decoration:
                const InputDecoration(hintText: "example: +201092452462"),
            keyboardType: TextInputType.phone,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                sendSms(phoneController.text.trim());
              },
              child: const Text("Send Code"),
            ),
          ],
        );
      },
    );
  }

  void sendSms(String phoneNumber) async {
    emit(state.copyWith(state: BaseApiState.loading));
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(state.copyWith(state: BaseApiState.success));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(state.copyWith(
            state: BaseApiState.failure, errorMessage: e.message));
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        emit(state.copyWith(state: BaseApiState.success));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<void> verifyOtp(String smsCode) async {
    if (verificationId == null) return;
    emit(state.copyWith(state: BaseApiState.loading));
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(state: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(
          state: BaseApiState.failure, errorMessage: e.toString()));
    }
  }

  void promptForOtp(BuildContext context) {
    showOtpDialog(context, (userOtp) {
      verifyOtp(userOtp);
    });
  }

  void showOtpDialog(BuildContext context, Function(String) onOtpEntered) {
    TextEditingController otpController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter OTP"),
          content: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter the OTP",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onOtpEntered(otpController.text);
              },
              child: const Text("Verify"),
            ),
          ],
        );
      },
    );
  }
}
