

import '../user/user.dart';

class AuthResponse {
  final String? message;
  final String? statusMsg;
  final AppUser? user;
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
      user: json["user"] == null ? null : AppUser.fromJson(json["user"]),
      token: json["token"],
      statusMsg: json["statusMsg"],
    );
  }
}

