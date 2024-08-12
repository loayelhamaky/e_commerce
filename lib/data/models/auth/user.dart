class User {
  User({
    required this.name,
    required this.email,
    required this.role,
  });

  final String? name;
  final String? email;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "role": role,
    };
  }
}
