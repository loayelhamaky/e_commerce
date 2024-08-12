import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/enums/base_api_state.dart';
import '../../../../domain/repos/auth_repo/auth_repo.dart';
import '../../../main_screen/view/main_screen_view.dart';
import '../../register/view.dart';
import '../auth_state.dart';

@singleton
class LoginVm extends Cubit<AuthState>{
  final AuthRepo authRepo;
  final InternetConnectionChecker internetConnectionChecker;
  bool connectionWasPreviouslyOffline = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  LoginVm(this.authRepo, this.internetConnectionChecker) : super(AuthState()) {
    _connectionStreamListener();
  }

  void _connectionStreamListener() {
    _connectionSubscription = internetConnectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        connectionWasPreviouslyOffline = true;
        emit(AuthState(state: BaseApiState.offline));
      } else if (status == InternetConnectionStatus.connected) {
        emit(AuthState(state: BaseApiState.online));
      }
    });
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    try {
      emit(AuthState(state: BaseApiState.loading));
      await authRepo.login(emailController.text, passwordController.text);
      emit(AuthState(state: BaseApiState.success));
    } catch (e) {
      emit(AuthState(state: BaseApiState.failure, errorMessage: e.toString()));
    }
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
    if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

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
}

/// Firebase Login method
  // @override
  // Future<void> login(String email, String password) async {
  //   if (!formKey.currentState!.validate()) return;
  //   emit(BaseState.initial(state: BaseScreenState.loading));
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  //
  //     if (userCredential.user != null) {
  //       emit(BaseState.initial(state: BaseScreenState.success));
  //     }
  //   } catch (e) {
  //     emit(BaseState.initial(
  //         state: BaseScreenState.failure,
  //         errorMessage: _handleError(e)));
  //   }
  // }
  //  String _handleError(dynamic e) {
  //     if (kDebugMode) {
  //       print('Exception: ${e.runtimeType}');
  //       print('Exception details: ${e.toString()}');
  //     }
  //
  //     if (e is FirebaseAuthException) {
  //       return _firebaseAuthErrorMessages[e.code] ?? 'Authentication error: ${e.message}';
  //     }
  //
  //     return 'An error occurred. Please try again.';
  //   }
  //
  //   final Map<String, String> _firebaseAuthErrorMessages = {
  //     'user-not-found': 'No user found for that email.',
  //     'wrong-password': 'Wrong password provided for that user.',
  //     'invalid-email': 'Your email address appears to be malformed.',
  //     'user-disabled': 'User with this email has been disabled.',
  //     'too-many-requests': 'Too many requests. Try again later.',
  //     'operation-not-allowed': 'Signing in with Email and Password is not enabled.',
  //   };


