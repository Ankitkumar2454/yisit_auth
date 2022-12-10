import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yisit_auth/authScreens/homepage.dart';
import 'package:yisit_auth/json/jsonClasses.dart';
import '../services/client.dart';

class VerificationCode extends StatefulWidget {
  static String id = 'verification_code';

  var uuid;
  var email;
  VerificationCode({this.uuid, this.email}) {} //constructor

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  var recievedOtp = '';
  var emailOtp;
  bool changeText = false;
  var status = "";
  final _formkey = GlobalKey<FormState>();
  Future<void> verify({
    required String? userid,
    required String? otp,
  }) async {
    try {
      if (_formkey.currentState!.validate()) {
        var user = VerifyUser(userId: userid, otp: otp);
        print(" user id : '${userid}'");
        print(recievedOtp);
        var response = await AuthClient().postVerifyUser('/verify-user', user);
        print(response);

        var values = jsonDecode(response);

        status = values["Status"];
        print("here status is $status");
        await Future.delayed(Duration(seconds: 1));
        if (status == "Verified") {
          Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade,
              isIos: true,
              duration: Duration(milliseconds: 900),
            ),
            (route) => false,
          );
        }
      } else {
        setState(() {
          changeText = true;
        });
        final text = "Enter a valid Otp";
        final snackBar = SnackBar(
          content: Text(text),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar((snackBar));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resendOtp({
    required String? userid,
    required String? parentemail,
  }) async {
    try {
      var _user = OtpResend(
        userId: userid,
        email: parentemail,
      );
      var response = await AuthClient().postResendCode("/resend-otp", _user);
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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                // height: 212,
                height: size.height * 0.243,
              ),
              Center(
                child: Container(
                  // height: 36,
                  // width: 212,
                  // color: Colors.green,
                  height: size.height * 0.040,
                  width: size.width * 0.67,
                  child: const Center(
                    child: Text(
                      "Verification Code",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                // height: 19,
                height: size.height * 0.020,
              ),
              Center(
                child: Container(
                  // height: 46,
                  // width: 293,
                  // color: Colors.green,
                  height: size.height * 0.055,
                  width: size.width * 0.76,
                  child: Center(
                    child: changeText
                        ? const Text(
                            "A new code has been sent to your associated mail id",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Poppins"),
                          )
                        : const Text(
                            "Please enter the verification code sent to Your phone number/ Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Poppins"),
                          ),
                  ),
                ),
              ),
              SizedBox(
                // height: 57,
                height: size.height * 0.058,
              ),
              Container(
                // height: 69,
                // width: 294,
                height: size.height * 0.082,
                width: size.width * 0.76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Color(0xff21C4A7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpBox(
                      otpController: otp1,
                    ),
                    OtpBox(
                      otpController: otp2,
                    ),
                    OtpBox(
                      otpController: otp3,
                    ),
                    OtpBox(
                      otpController: otp4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 52,
                height: size.height * 0.055,
              ),
              Container(
                // height: 20,
                // width: 151,
                // color: Colors.green,
                height: size.height * 0.025,
                width: size.width * 0.45,
                child: const Center(
                  child: Text(
                    "Didn’t Receive an OTP ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  resendOtp(
                    userid: widget.uuid,
                    parentemail: widget.email,
                  );

                  final text = "Otp Sent";
                  final snackBar = SnackBar(content: Text(text));
                  ScaffoldMessenger.of(context).showSnackBar((snackBar));
                },
                child: Container(
                  // height: 18,
                  // width: 71,
                  height: size.height * 0.022,
                  width: size.width * 0.35,
                  child: const Center(
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffFFFFFF),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                // height: 45,
                height: size.height * 0.050,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    recievedOtp = otp1.text.toString() +
                        otp2.text.toString() +
                        otp3.text.toString() +
                        otp4.text.toString();
                  });
                  verify(
                    userid: widget.uuid,
                    otp: recievedOtp,
                  );
                  // also here we can put that scaffold
                },
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
                      // height: 30,
                      // width: 311,
                      height: size.height * 0.036,
                      width: size.width * 0.81,
                      child: const Center(
                        child: Text(
                          'Submit',
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
            ],
          ),
        ),
      ),
    ));
  }
}

class OtpBox extends StatelessWidget {
  TextEditingController otpController;
  OtpBox({required this.otpController});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff103444),
      ),
      child: TextFormField(
        controller: otpController,
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          } else {
            return null;
          }
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
