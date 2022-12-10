import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yisit_auth/authScreens/signUp2.dart';
class SignUpPage extends StatefulWidget {
  static String id = "signUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  nextSignUpPage() async {
    if (_formkey.currentState!.validate()) {
      Navigator.push(
        context,
        PageTransition(
          child: SignUpPage2(
            parentName: parentNameController,
            studentname: studentNameController,
            phoneNo: phoneNumberController,
          ),
          type: PageTransitionType.fade,
          isIos: true,
          duration: Duration(milliseconds: 900),
        ),
      );

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => SignUpPage2(
      //       parentName: parentNameController,
      //       studentname: studentNameController,
      //       phoneNo: phoneNumberController,
      //     ),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 55,
                    height: size.height * 0.05,
                  ),
                  Center(
                    child: Container(
                      // height: 36.54,
                      // width: 71,
                      height: size.height * 0.04,
                      width: size.height * 0.08,
                      child: Image(
                          image: AssetImage('assets/yisit-coloured-logo.png')),
                    ),
                  ),
                  SizedBox(
                    // height: 35.46,
                    height: size.height * 0.043,
                  ),
                  Container(
                    // height: 26,
                    // width: 80,
                    height: size.height * 0.036,
                    width: size.height * 0.80,
                    // color: Colors.red,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          height: 1.2,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                          fontFamily: "Google Sans"),
                    ),
                  ),
                  SizedBox(
                    // height: 16,
                    height: size.height * 0.018,
                  ),
                  Container(
                    // height: 20,
                    // width: 194,
                    height: size.height * 0.024,
                    width: size.height * 0.25,
                    // color: Colors.red,
                    child: const Text(
                      "Get started by creating account.",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                          fontFamily: "Google Sans"),
                    ),
                  ),
                  SizedBox(
                    // height: 34,
                    height: size.height * 0.038,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "parent name cannot be empty";
                          } else
                            return null;
                        },
                        controller: parentNameController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              // height: 20,
                              // width: 20,
                              height: size.height * 0.020,
                              width: size.width * 0.020,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 3),
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          hintText: "Parent Name",
                          hintStyle: const TextStyle(
                            fontFamily: "Google Sans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(
                        // height: 30,
                        height: size.height * 0.035,
                      ),
                      //Student Name
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: studentNameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "student name cannot be empty";
                          }
                          // else if(value!=data.email){
                          //  return "Enter a valid username";
                          // }
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              // height: 20,
                              // width: 20,
                              height: size.height * 0.020,
                              width: size.width * 0.020,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 3),
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          hintText: "Student Name",
                          hintStyle: const TextStyle(
                            fontFamily: "Google Sans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(
                        // height: 30,
                        height: size.height * 0.035,
                      ),
                      // phone number
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "phoneNumber cannot be empty";
                          } else if (value.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              // height: 20,
                              // width: 20,
                              height: size.height * 0.020,
                              width: size.width * 0.020,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 3),
                                child: Icon(
                                  Icons.lock,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          hintText: "Phone Number",
                          hintStyle: const TextStyle(
                            fontFamily: "Google Sans",
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    // height: 28,
                    height: size.height * 0.032,
                  ),
                  // next
                  Center(
                    child: Container(
                      // height: 56,
                      // width: 311,
                      height: size.height * 0.065,
                      width: size.width * 0.81,
                      child: GestureDetector(
                        onTap: () {
                          nextSignUpPage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(96),
                            color: Color(0xff21C4A7),
                          ),
                          child: Center(
                            child: Container(
                              // height: 30,
                              // width: 311,
                              height: size.height * 0.030,
                              width: size.width * 0.81,
                              child: const Center(
                                child: Text(
                                  'Next',
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
                  ),
                  SizedBox(
                    // height: 100,
                    height: size.height * 0.150,
                  ),
                  Center(
                    child: Container(
                      // height: 24,
                      // width: 89,
                      height: size.height * 0.035,
                      width: size.width * 0.26,
                      child: const Center(
                        child: Text(
                          "Made with science by",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      // height: 100,
                      // width: 100,
                      height: size.height * 0.12,
                      width: size.width * 0.30,
                      child: Image(
                          image:
                              AssetImage('assets/STILr-App-asset-white.png')),
                    ),
                  ),
                  // SizedBox(
                  //   height: 57,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
