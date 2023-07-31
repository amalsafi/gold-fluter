import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/view/screen/Signin.dart';
import 'package:flutter_application_1/view/screen/Homepage.dart';
import 'package:flutter_application_1/view/screen/signup1.dart';
import 'package:flutter_application_1/view/screenowner/signinOwner.dart';
import 'package:provider/provider.dart';
import 'Auth.dart';
import 'package:flutter_application_1/view/screen/cart_item.dart';
//  throw new GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( 
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), 
      ],
   child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {
      'Auth': (context) => Auth(),
      'HomeScreen': (context) => Homepage(),
      'SignupScreen': (context) => SignupPage(),
      'Signin': (context) => const Signin(),
      'LoginScreenOwner': (context) => const SigninOwner(),
    },
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), splashscreen);
  }

  void splashscreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Auth(),
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
