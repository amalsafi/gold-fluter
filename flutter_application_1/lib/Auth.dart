import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/Profilepersonly.dart';
import 'package:flutter_application_1/view/screen/profileperson.dart';

import 'package:flutter_application_1/view/screen/signin.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Profilepersonly();
        } else {
          return Signin();
        }
      },
    ));
  }
}
