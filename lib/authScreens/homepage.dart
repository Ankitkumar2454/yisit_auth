import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yisit_auth/authScreens/logout.dart';

class HomePage extends StatelessWidget {
  static final id = "homepage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            Center(
              child: Text(
                "Successfully signup",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 59, 5, 5),
                    fontFamily: "Google Sans"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Logout())),
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "logout",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 248, 247, 247),
                        fontFamily: "Google Sans"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
