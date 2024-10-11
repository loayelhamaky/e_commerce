class AppUser {
  AppUser({
    required this.name,
    required this.email,
    required this.role,
  });

  final String? name;
  final String? email;
  final String? role;

  factory AppUser.fromJson(Map<String, dynamic> json){
    return AppUser(
      name: json["name"],
      email: json["email"],
      role: json["role"],
    );
  }
}