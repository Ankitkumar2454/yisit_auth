import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.parentName,
    this.studentName,
    this.email,
    this.mobile,
    this.password,
    this.role,
  });

  String? parentName;
  String? studentName;
  String? email;
  String? mobile;
  String? password;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        parentName: json["parent_name"],
        studentName: json["student_name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "parent_name": parentName,
        "student_name": studentName,
        "email": email,
        "mobile": mobile,
        "password": password,
        "role": role,
      };
}
