import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/changepassword.dart';
import 'package:flutter_application_1/view/screen/forgetpass.dart';
import 'package:flutter_application_1/view/screen/forgetpassword.dart';
import 'package:get/get.dart';

import 'Profilepersonly.dart';
import 'changepass.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

// Future signin() async {
//   await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passController.text.trim());
// }

// void _trySubmitForm() {
//   final bool? isValid = formstate.currentState?.validate();
//   if (isValid == true) {
//     debugPrint('Everything looks good!');
//     debugPrint(_Name);

//     debugPrint(_password);
//   }
// }

// @override
// void dispose() {
//   _emailController.dispose();
//   _passController.dispose();
//   super.dispose();
// }

class _SigninState extends State<Signin> {
  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
  }

  void _trySubmitForm() {
    final bool? isValid = formstate.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_Name);

      debugPrint(_password);
    }
  }

  bool obscreText = true;
  String _Name = '';

  String _password = '';
  String _email = '';
  late TextEditingController _emailController;
  late TextEditingController _passController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed('SignupScreen');
  }

// final _emailController = TextEditingController();
// final _passController = TextEditingController();
  final formstate = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          titleSpacing: 38,
          titleTextStyle: TextStyle(height: 2),
          leading: Icon(
            Icons.chevron_left_rounded,
            color: Color.fromARGB(255, 235, 201, 26),
            size: 30,
          ),
          title: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'تسجيل الدخول',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromARGB(255, 235, 201, 26),
                fontSize: 30,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formstate,
              child: Column(
                children: [
                  Image(image: AssetImage('assets/signup.png')),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              )),
                          focusColor: Color.fromARGB(255, 241, 213, 74),
                          hintText: 'البريد الالكتروني ',
                          hintTextDirection: TextDirection.rtl,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 241, 213, 74),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              ))),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return 'املئ الايميل ';
                        }

                        return null;
                      },
                      onChanged: (value) => _email = value,
                      // onChanged: (value) => {
                      //       setState(
                      //         () {
                      //           value = _Email;
                      //         },
                      //       )
                      //     }
                    ),
                  ),
                  SizedBox(
                    height: 14.7,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passController,
                      obscureText: obscreText,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              )),
                          focusColor: Color.fromARGB(255, 241, 213, 74),
                          hintText: 'كلمة المرور ',
                          hintTextDirection: TextDirection.rtl,
                          suffixIcon: GestureDetector(
                            onTap: (() {
                              setState(() {
                                obscreText = !obscreText;
                              });
                            }),
                            child: Icon(
                              obscreText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              ))),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
                        }

                        return null;
                      },
                      onChanged: (value) => _password = value,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Forgetpasss(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: openSignUpScreen,
                          child: Text(
                            ' Sign up  ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 241, 213, 74),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: Text(
                          'هل نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 241, 213, 74),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Container(
                    width: 305,
                    height: 57,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Color.fromARGB(255, 241, 213, 74),
                          shape: StadiumBorder()),
                      onPressed: signin,
                      //  () {
                      //   if (formstate.currentState!.validate()) {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (_) => Profilepersonly(),
                      //       ),
                      //     );
                      //   }
                      // },
                      child: Center(
                          child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
