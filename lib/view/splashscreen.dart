import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), splashscreen);
  }

  void splashscreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Auth(), // استبدل Auth بالصفحة التي تريد توجيه المستخدم إليها بعد انتهاء شاشة البدء (Splash Screen).
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image(image: AssetImage('assets/Group39.png'))),
    );
  }
}
