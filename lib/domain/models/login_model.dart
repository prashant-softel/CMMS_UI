class LoginModel {
  String userName;
  String password;

  LoginModel({
    required this.userName,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userName: json["user_name"],
        password: json["password"],
      );

  Map<String, String> toJson() => {
        "user_name": userName,
        "password": password,
      };
}
