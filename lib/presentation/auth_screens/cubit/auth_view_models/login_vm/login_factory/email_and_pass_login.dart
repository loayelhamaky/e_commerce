import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/login_factory.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../di/di.dart';
import '../../../../../../domain/interface_repos/auth_repo.dart';

class LoginWithEmailAndPass implements LoginFactory {
  final AuthRepo authRepo = getIt<AuthRepo>();
  final String email;
  final String password;
  LoginWithEmailAndPass(this.email,this.password);
  @override
  Future<void> login() async {
    try{

      print("email");
      await authRepo.login(
          email, password);
    } catch (e){
      throw e.toString();
    }
  }

}