import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/catogry.dart';
import 'package:flutter_application_1/view/screen/forgetpass.dart';
import 'package:flutter_application_1/view/screen/forgetpassword.dart';
import 'package:flutter_application_1/view/screenowner/catogryowner.dart';

class SigninOwner extends StatefulWidget {
  const SigninOwner({Key? key}) : super(key: key);

  @override
  State<SigninOwner> createState() => _SigninOwnerState();
}

class _SigninOwnerState extends State<SigninOwner> {
  bool obscreText = true;
  String _email = '';
  String _password = '';
  late TextEditingController _emailController;
  late TextEditingController _passController;
  final formstate = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed('SignupScreen');
  }

  void loginWithCredentials() async {
    final username = 'gold';
    final password = '123456**';

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$username@test.com',
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => catogryowner()),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('خطأ'),
            content: Text(
                'فشل تسجيل الدخول. يرجى التحقق من اسم المستخدم وكلمة المرور.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('حسنًا'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 38,
        titleTextStyle: TextStyle(height: 2),
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
                SizedBox(height: 40),
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
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 241, 213, 74),
                        ),
                      ),
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
                        ),
                      ),
                    ),
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
                SizedBox(height: 14.7),
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
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 241, 213, 74),
                        ),
                      ),
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
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
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
                    children: [],
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
                            builder: (context) => ForgotPasswordScreen(),
                          ),
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
                SizedBox(height: 26),
                Container(
                  width: 305,
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      primary: Color.fromARGB(255, 241, 213, 74),
                      shape: StadiumBorder(),
                    ),
                    onPressed: loginWithCredentials,
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
