import 'package:e_commerce_app/data/models/user/user.dart';
import 'package:e_commerce_app/data/models/user/user_response_errors.dart';

class UserResponse {
  UserResponse({
    required this.message,
    this.user,
    this.errors,
  });

  final String? message;
  final AppUser? user;
  final UserResponseErrors? errors;

  factory UserResponse.fromJson(Map<String, dynamic> json){
    return UserResponse(
      message: json["message"],
      user: json["user"] == null ? null : AppUser.fromJson(json["user"]),
      errors: json["errors"] == null ? null : UserResponseErrors.fromJson(json["errors"]),

    );
  }
}

