import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:yisit_auth/authScreens/ForgotPadsswordVerification.dart';
import 'package:yisit_auth/json/jsonClasses.dart';
import '../services/client.dart';
import 'verificationCode.dart';

class ForgotPassword extends StatefulWidget {
  static String id = "forgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var uuid;
  getOtpFromEmail({String? email}) async {
    try {
      var _searchUuid = GetUserId(
        email: email,
      );
      var uuidResponse =
          await AuthClient().postSearchUser('/forgot-password', _searchUuid);
      print(uuidResponse);
      setState(() {
        var values = jsonDecode(uuidResponse);
        uuid = values["data"]["userId"];
        print(uuid);
        // send uuid on resendotp
        resendOtp(
          email: emailController.text.toString(),
          uuid: uuid,
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void resendOtp({String? email, String? uuid}) async {
    try {
      var _otpResend = OtpResend(
        email: email,
        userId: uuid,
      );
      var response =
          await AuthClient().postResendCode('/resend-otp', _otpResend);
      print(" hello $response");
      setState(() {
        var value = jsonDecode(response);
        var message = value["message"];
        var responseEmail = value["data"]["email"];
        print(message);
        if (_formkey.currentState!.validate()) {
          //   // await Future.delayed(Duration(seconds: 1));
          if (EmailValidator.validate(emailController.text.trim())) {
            if (message == "Verfication OTP sent") {
              // print(message == "Verfication OTP sent");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotVerificationCode(
                    uuid: uuid,
                    email: responseEmail,
                  ),
                ),
              );
            }
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 135,
                    height: size.height * 0.158,
                  ),
                  Container(
                    // height: 28,
                    // width: 189,
                    // color: Colors.blue,
                    height: size.height * 0.039,
                    width: size.height * 0.23,
                    child: const Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                          fontFamily: "Google Sans"),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    // height: 30,
                    // width: 342,
                    // color: Colors.blue,
                    height: size.height * 0.048,
                    width: size.height * 0.40,
                    child: const Center(
                      child: Text(
                        "Don’t worry it happens, Please enter the mail id associated with your account.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                            fontFamily: "Google Sans"),
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: 32,
                    height: size.height * 0.038,
                  ),
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.white),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "email cannot be empty";
                      } else if (EmailValidator.validate(
                              emailController.text.trim()) ==
                          false) {
                        return "verify email again ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        // height: 20,
                        // width: 20,
                        height: size.height * 0.020,
                        width: size.width * 0.020,
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.mail,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      hintText: "Email ID",
                      hintStyle: TextStyle(
                        fontFamily: "Google Sans",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: 32,
                    height: size.height * 0.038,
                  ),
                  GestureDetector(
                    onTap: () {
                      getOtpFromEmail(email: emailController.text.trim());
                    },
                    child: Center(
                      child: Container(
                        // height: 56,
                        // width: 311,
                        height: size.height * 0.065,
                        width: size.width * 0.81,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(96),
                          color: Color(0xff21C4A7),
                        ),
                        child: Center(
                          child: Container(
                            // color: Colors.red,
                            // height: 30,
                            // width: 311,
                            height: size.height * 0.036,
                            width: size.width * 0.81,
                            child: const Center(
                              child: Text(
                                'Send OTP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
