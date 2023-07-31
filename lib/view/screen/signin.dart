import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/catogry.dart';
import 'package:flutter_application_1/view/screen/changepassword.dart';
import 'package:flutter_application_1/view/screen/forgetpass.dart';
import 'package:flutter_application_1/view/screen/forgetpassword.dart';
import 'package:flutter_application_1/view/screen/homepage.dart';
import 'package:get/get.dart';

import 'Profilepersonly.dart';
import 'changepass.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Future<void> signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim());

      // التسجيل بنجاح، انتقل إلى الصفحة التالية
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              catogry(), // استبدل NextPage() بالصفحة التالية التي تريد عرضها
        ),
      );
    } catch (e) {
      // حدث خطأ أثناء التسجيل، عرض showDialog يحتوي على رسالة الخطأ
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('خطأ في عملية التسجيل'),
            content: Text(
                'يرجى التأكد من البريد الإلكتروني وكلمة المرور والمحاولة مرة أخرى.'),
            actions: [
              TextButton(
                child: Text('حسنا'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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

  final formstate = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          titleSpacing: 38,
          titleTextStyle: TextStyle(height: 2),
          // leading: Icon(
          //   Icons.chevron_left_rounded,
          //   color: Color.fromARGB(255, 235, 201, 26),
          //   size: 30,
          // ),
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
                            !RegExp(r'^(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return 'املئ الايميل ';
                        }

                        return null;
                      },
                      onChanged: (value) => _email = value,
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
                      // validator: (value) {
                      //   if (value == null ||
                      //       value.trim().isEmpty ||
                      //       !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
                      //     return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
                      //   }

                      //   return null;
                      // },
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
                            ' تسجيل الاشتراك ',
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
