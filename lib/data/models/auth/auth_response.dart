
import 'package:e_commerce_app/data/models/auth/user.dart';

class AuthResponse {
  final String? message;
  final String? statusMsg;
  final User? user;
  final String? token;

  AuthResponse({
    required this.message,
    required this.user,
    required this.token,
    required this.statusMsg,
  });


  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json["message"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      token: json["token"],
      statusMsg: json["statusMsg"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "user": user?.toJson(),
      "token": token,
      "statusMsg": statusMsg,
    };
  }
}

