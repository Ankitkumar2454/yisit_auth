// json for login

import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  LoginUser({
    this.userEmail,
    this.password,
  });

  String? userEmail;
  String? password;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        userEmail: json["userEmail"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "password": password,
      };
}

// for verification Code
VerifyUser verifyUserFromJson(String str) =>
    VerifyUser.fromJson(json.decode(str));

String verifyUserToJson(VerifyUser data) => json.encode(data.toJson());

class VerifyUser {
  VerifyUser({
    this.userId,
    this.otp,
  });

  String? userId;
  String? otp;

  factory VerifyUser.fromJson(Map<String, dynamic> json) => VerifyUser(
        userId: json["userId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "otp": otp,
      };
}
// resendOtpJson

OtpResend otpResendFromJson(String str) => OtpResend.fromJson(json.decode(str));

String otpResendToJson(OtpResend data) => json.encode(data.toJson());

class OtpResend {
  OtpResend({
    this.userId,
    this.email,
  });

  String? userId;
  String? email;

  factory OtpResend.fromJson(Map<String, dynamic> json) => OtpResend(
        userId: json["userId"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
      };
}

// reset password
ResetPassword resetPasswordFromJson(String str) =>
    ResetPassword.fromJson(json.decode(str));

String resetPasswordToJson(ResetPassword data) => json.encode(data.toJson());

class ResetPassword {
  ResetPassword({
    this.email,
    this.code,
    this.password,
  });

  String? email;
  String? code;
  String? password;

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
        email: json["email"],
        code: json["code"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
        "password": password,
      };
}

// serach-Userid
GetUserId getUserIdFromJson(String str) => GetUserId.fromJson(json.decode(str));

String getUserIdToJson(GetUserId data) => json.encode(data.toJson());

class GetUserId {
  GetUserId({
    this.email,
  });

  String? email;

  factory GetUserId.fromJson(Map<String, dynamic> json) => GetUserId(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };

}

UpdatePassword updatePasswordFromJson(String str) => UpdatePassword.fromJson(json.decode(str));

String updatePasswordToJson(UpdatePassword data) => json.encode(data.toJson());

class UpdatePassword {
    UpdatePassword({
        this.userId,
        this.otp,
        this.password,
    });

    String ?userId;
    String ?otp;
    String ?password;

    factory UpdatePassword.fromJson(Map<String, dynamic> json) => UpdatePassword(
        userId: json["userId"],
        otp: json["otp"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "otp": otp,
        "password": password,
    };
}
