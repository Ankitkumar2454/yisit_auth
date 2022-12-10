import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yisit_auth/authScreens/homepage.dart';
import 'authScreens/ForgotPadsswordVerification.dart';
import 'authScreens/forgotPassword.dart';
import 'authScreens/newPassword.dart';
import 'authScreens/signInPage.dart';
import 'authScreens/signUp.dart';
import 'authScreens/signUp2.dart';
import 'authScreens/verificationCode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

final navigatorKey = GlobalKey<NavigatorState>();

//here making changes for mediaquery
class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff062537),
      ),
      home: isLoggedIn ? HomePage() : SignIn(),
      routes: {
        SignIn.id: (context) => SignIn(),
        SignUpPage.id: (context) => SignUpPage(),
        SignUpPage2.id: (context) => SignUpPage2(),
        ForgotPassword.id: (context) => ForgotPassword(),
        VerificationCode.id: (context) => VerificationCode(),
        ForgotVerificationCode.id: (context) => ForgotVerificationCode(),
        NewPassword.id: (context) => NewPassword(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
