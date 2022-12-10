import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yisit_auth/authScreens/signInPage.dart';

class Logout extends StatefulWidget {
  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  Future<void> logouthere() async {
    final response =
        await http.get(Uri.parse('http://178.128.63.131:3001/logout-user'));
    var res = jsonDecode(response.body.toString());
    print(res);
    //   print('Account logout successfully');
    // if (response.statusCode == 200) {
    //   // var res = jsonDecode(response.body.toString());
    //   // print(res);
    //   print('Account logout successfully');
    // } else {
    //   print("failed");
    // }
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                'click here for logout',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF),
                    fontFamily: "Google Sans"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //logout
          GestureDetector(
            onTap: () => logouthere(),
            child: Container(
              height: 56,
              width: 311,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(96),
                color: Color(0xff21C4A7),
              ),
              child: Center(
                child: Container(
                  // color: Colors.red,
                  height: 30,
                  width: 311,
                  child: const Center(
                    child: Text(
                      'logout',
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
    );
  }
}
