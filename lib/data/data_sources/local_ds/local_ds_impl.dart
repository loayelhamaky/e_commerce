import 'package:injectable/injectable.dart';

import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/error/error_strings.dart';
import 'local_ds.dart';

@Injectable(as: AuthLocalDs)
class AuthLocalDsImpl extends AuthLocalDs {
  @override
  login(String email, String password) {
  //  throw ErrorStrings.internetErrorMessage;
  }

  @override
   register(String userName, String mobileNum, String email, String password) {
   // throw ErrorStrings.internetErrorMessage;
  }

  @override
  getCategories() {
   // throw UnimplementedError();
  }
}
