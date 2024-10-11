import 'package:dartz/dartz.dart';

import '../../data/models/user/user.dart';

abstract class ProfileRepo{
  Future<Either<String, AppUser?>> updateUserData({String? name, String? email});
}