import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/enums/base_api_state.dart';
import '../../../../domain/repos/auth_repo/auth_repo.dart';
import '../../../main_screen/view/main_screen_view.dart';
import '../../login/view.dart';
import '../auth_state.dart';

@singleton
class RegisterVm extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final InternetConnectionChecker internetConnectionChecker;
  bool connectionWasPreviouslyOffline = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var mobileNumController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  RegisterVm(this.authRepo, this.internetConnectionChecker)
      : super(AuthState()) {
    _connectionStreamListener();
  }

  void _connectionStreamListener() {
    _connectionSubscription =
        internetConnectionChecker.onStatusChange.listen((status) {
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

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

      emit(AuthState(state: BaseApiState.loading));
      try {
        await authRepo.register(emailController.text, passwordController.text,
            userNameController.text, mobileNumController.text);
        emit(AuthState(state: BaseApiState.success));
      } catch (e) {
        emit(AuthState(
            state: BaseApiState.failure, errorMessage: e.toString()));
      }

  }

  void emptyFields() {
    userNameController.text = '';
    mobileNumController.text = '';
    emailController.text = '';
    passwordController.text = '';
  }


  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }


  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$')
        .hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.trim().isEmpty) {
      return 'please enter your full name';
    }
    return null;
  }

  String? validatePassword(String? password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password == null || password.trim().isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(password)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }

  String? validateUserName(String? userName) {
    if (userName == null || userName.trim().isEmpty) {
      return 'please enter your full name';
    }
    return null;
  }

  navigateToHome(context) {
    Navigator.pushReplacementNamed(context, MainScreen.routeName);
  }
}
