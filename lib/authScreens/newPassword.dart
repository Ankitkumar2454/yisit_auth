import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yisit_auth/json/jsonClasses.dart';
import 'package:yisit_auth/services/client.dart';

import 'homepage.dart';

class NewPassword extends StatefulWidget {
  static String id = "Newpassword";
  var uuid;
  var OtpCode;

  NewPassword({this.uuid, this.OtpCode});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController conformnewpasswordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _secureTextpass1 = true;
  bool _secureTextpass2 = true;
  Future<void> conformNewPassword(String updatedPassword) async {
    var userId = widget.uuid;
    var otp = widget.OtpCode;

    // showDialog(
    //   context: context,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      var resetPass = UpdatePassword(
        userId: userId,
        otp: otp,
        password: updatedPassword,
      );
      var response =
          await AuthClient().postUpdatePassword('/update-password', resetPass);
      print(response);
      if (_formkey.currentState!.validate()) {
        //put validation on matching something it will navigate to next screen......
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print(e.toString());
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 134,
                  ),
                  Container(
                    height: 33,
                    width: 276,
                    child: const Text(
                      "Enter your new password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                          fontFamily: "Poppins"),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _secureTextpass1,
                    controller: newpasswordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty)
                        return "password cannot be empty";
                      else if (value.length < 8)
                        return "password must be atleast 8";
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureTextpass1 = !_secureTextpass1;
                            });
                          },
                          icon: _secureTextpass1
                              ? Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  color: Color(0xffFFFFFF),
                                )
                              : Icon(
                                  CupertinoIcons.eye_fill,
                                  color: Color(0xffFFFFFF),
                                )),
                      prefixIcon: Container(
                        height: 20,
                        width: 20,
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      hintText: "Your new Password",
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: conformnewpasswordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty)
                        return "field cannot be empty";
                      else if (value.length != 8)
                        return "password must be 8";
                      else if (value != newpasswordcontroller.text.trim())
                        return "recheck the password ";
                      else
                        return null;
                    },
                    obscureText: _secureTextpass2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _secureTextpass2 = !_secureTextpass2;
                          });
                        },
                        icon: _secureTextpass2
                            ? const Icon(
                                CupertinoIcons.eye_slash_fill,
                                color: Color(0xffFFFFFF),
                              )
                            : const Icon(
                                CupertinoIcons.eye_fill,
                                color: Color(0xffFFFFFF),
                              ),
                      ),
                      prefixIcon: Container(
                        height: 20,
                        width: 20,
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 73,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_formkey.currentState!.validate()) {
                          conformNewPassword(newpasswordcontroller.text.trim());
                        }
                      });

                      // Navigator.pushNamed(context, VerificationCode.id);
                    },
                    child: Center(
                      child: Container(
                        height: 56,
                        width: 311,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(96),
                          color: Color(0xff21C4A7),
                        ),
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 311,
                            child: const Center(
                              child: Text(
                                'Confirm',
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
