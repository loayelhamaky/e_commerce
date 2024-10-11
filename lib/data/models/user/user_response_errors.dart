class UserResponseErrors {
  UserResponseErrors({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  factory UserResponseErrors.fromJson(Map<String, dynamic> json){
    return UserResponseErrors(
      value: json["value"],
      msg: json["msg"],
      param: json["param"],
      location: json["location"],
    );
  }

  Map<String, dynamic> toJson() => {
    "value": value,
    "msg": msg,
    "param": param,
    "location": location,
  };

}
