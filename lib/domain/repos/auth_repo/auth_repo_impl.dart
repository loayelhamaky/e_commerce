import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../data/data_sources/local_ds/local_ds.dart';
import '../../../data/data_sources/remote_ds/remote_ds.dart';
import 'auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDs remoteDs;
  final AuthLocalDs localDs;
  final InternetConnectionChecker internetConnectionChecker;

  AuthRepoImpl(this.localDs, this.remoteDs, this.internetConnectionChecker);

  @override
  Future login(String email, String password) async {
      await remoteDs.login(email, password);
     // localDs.login(email, password);
    }

  @override
  Future register( String email, String password,String userName, String mobileNum,) async{
    await remoteDs.register(email, password,userName,mobileNum);
   // localDs.register(userName,mobileNum,email,password);
  }

}
