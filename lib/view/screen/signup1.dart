// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/Auth.dart';
// import 'package:flutter_application_1/view/screen/Profilepersonly.dart';
// import 'package:flutter_application_1/view/screen/changepassword.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Signup1 extends StatefulWidget {
//   const Signup1({Key? key}) : super(key: key);

//   @override
//   State<Signup1> createState() => _Signup1State();
// }

// class _Signup1State extends State<Signup1> {
//   @override
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _IdentificationController = TextEditingController();

//   Future<void> _registerUser() async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passController.text.trim(),
//       );

//       // Create a new document in the "users" collection with the user's details
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'name': _nameController.text,
//         'phone': _phoneController.text,
//         'Identification': _IdentificationController.text,
//         'email': _emailController.text.trim(),
//         // other user details
//       });

//       Navigator.of(context).pushNamed('Auth');
//     } catch (e) {
//       // Handle registration errors
//       print('Error registering user: $e');
//       // Display error message to the user
//     }
//   }

//   // Future Signup1() async {
//   //   if (passconfirmed()) {
//   //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//   //         email: _emailController.text.trim(),
//   //         password: _passController.text.trim());
//   //     Navigator.of(context).pushNamed('Auth');
//   //   }
//   // }

//   bool passconfirmed() {
//     if (_passController.text.trim() == _confirmpassController.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void _trySubmitForm() {
//     final bool? isValid = formstate.currentState?.validate();
//     if (isValid == true) {
//       debugPrint('Everything looks good!');
//       debugPrint(_Name);

//       debugPrint(_password);
//     }
//   }

//   bool obscreText = true;
//   String _Name = '';
//   String _Email = '';
//   String _password = '';
//   String _Phone = '';
//   String _Identification = '';

//   late TextEditingController _emailController;
//   late TextEditingController _passController;
//   late TextEditingController _confirmpassController;

//   @override
//   void initState() {
//     _emailController = TextEditingController();
//     _passController = TextEditingController();
//     _confirmpassController = TextEditingController();
//     super.initState();
//   }

//   void openSigninScreen() {
//     Navigator.of(context).pushReplacementNamed('LoginScreen');
//   }

// // final _emailController = TextEditingController();
// // final _passController = TextEditingController();
//   final formstate = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passController.dispose();
//     _confirmpassController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         // resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           toolbarHeight: 70,
//           titleSpacing: 38,
//           titleTextStyle: TextStyle(height: 2),
//           // leading: Icon(
//           //   Icons.chevron_left_rounded,
//           //   color: Color.fromARGB(255, 235, 201, 26),
//           //   size: 30,
//           // ),
//           title: Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               'تسجيل الاشتراك',
//               textDirection: TextDirection.rtl,
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 color: Color.fromARGB(255, 235, 201, 26),
//                 fontSize: 30,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               key: formstate,
//               child: Column(
//                 children: [
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _nameController,
//                       cursorColor: Colors.black,
//                       keyboardType: TextInputType.text,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: 'اسم المستخدم',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.person_outline_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             !RegExp("^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*")
//                                 .hasMatch(value)) {
//                           return 'ادخل الاسم';
//                         }

//                         // Return null if the entered username is valid
//                         return null;
//                       },
//                       onChanged: (value) => _Name = value,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.7,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _IdentificationController,
//                       cursorColor: Colors.black,
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: 'رقم الهوية',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.library_books_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             value.length > 10 ||
//                             value.length < 10) {
//                           return 'يتكون من 9 ارقام';
//                         }

//                         return null;
//                       },
//                       onChanged: (value) => _Identification = value,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.7,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _phoneController,
//                       cursorColor: Colors.black,
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: '  رقم الهاتف ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.phone_enabled_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             value.length > 10 ||
//                             value.length < 10) {
//                           return 'يتكون من 10 ارقام';
//                         }

//                         return null;
//                       },
//                       onChanged: (value) => _Phone = value,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.7,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _emailController,
//                       cursorColor: Colors.black,
//                       keyboardType: TextInputType.emailAddress,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: 'البريد الالكتروني ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.email_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             !RegExp(r'^(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$')
//                                 // !RegExp(r"^[a-zA-Z0-9_\-.]+@[a-z]+\.[a-z]")
//                                 .hasMatch(value)) {
//                           return 'املئ الايميل ';
//                         }

//                         return null;
//                       },
//                       onChanged: (value) => _Email = value,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.7,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _passController,
//                       obscureText: obscreText,
//                       cursorColor: Colors.black,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: 'كلمة المرور ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: GestureDetector(
//                             onTap: (() {
//                               setState(() {
//                                 obscreText = !obscreText;
//                               });
//                             }),
//                             child: Icon(
//                               obscreText == true
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Color.fromARGB(255, 241, 213, 74),
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
//                           return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
//                         }

//                         return null;
//                       },
//                       onChanged: (value) => _password = value,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.7,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextFormField(
//                       controller: _confirmpassController,
//                       obscureText: obscreText,
//                       cursorColor: Colors.black,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               )),
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: ' تاكيد كلمة المرور ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: GestureDetector(
//                             onTap: (() {
//                               setState(() {
//                                 obscreText = !obscreText;
//                               });
//                             }),
//                             child: Icon(
//                               obscreText == true
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Color.fromARGB(255, 241, 213, 74),
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                       validator: (value) {
//                         if (value == null ||
//                             value.trim().isEmpty ||
//                             !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
//                           return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
//                         }

//                         return null;
//                       },
//                       onChanged: (value) => _password = value,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: openSigninScreen,
//                         child: Text(
//                           ' تسجيل الدخول ',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     width: 305,
//                     height: 57,
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           elevation: 3,
//                           backgroundColor: Color.fromARGB(255, 241, 213, 74),
//                           shape: StadiumBorder()),
//                       onPressed: _registerUser,
//                       child: Center(
//                           child: Text(
//                         'تسجيل الاشتراك',
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  void openSigninScreen() {
    Navigator.pop(context);
  }

  void _signUp() async {
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        // عندما تكون كلمة المرور وتأكيد كلمة المرور غير متطابقين
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('خطأ'),
              content: Text('كلمة المرور وتأكيد كلمة المرور غير متطابقين.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('حسناً'),
                ),
              ],
            );
          },
        );
      } else {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // حفظ بقية المعلومات في قاعدة البيانات
        String userId = userCredential.user!.uid;

        FirebaseFirestore.instance.collection('Customers').doc(userId).set({
          'username': _usernameController.text,
          'idNumber': _idNumberController.text,
          'phoneNumber': _phoneNumberController.text,
          'email': _emailController.text,
          'address': _addressController.text,
        });

        // نجاح التسجيل
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('نجاح'),
              content: Text('تم تسجيل الاشتراك بنجاح.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('حسناً'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
      // حدث خطأ أثناء التسجيل
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('خطأ'),
            content: Text('حدث خطأ أثناء التسجيل.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('حسناً'),
              ),
            ],
          );
        },
      );
    }
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
            'تسجيل الاشتراك',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 69),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _usernameController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
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
                        hintText: 'اسم المستخدم',
                        hintTextDirection: TextDirection.rtl,
                        suffixIcon: const Icon(
                          Icons.person_outline_outlined,
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
                          !RegExp("^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*")
                              .hasMatch(value)) {
                        return 'ادخل الاسم';
                      }

                      // Return null if the entered username is valid
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _idNumberController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
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
                        hintText: 'رقم الهوية',
                        hintTextDirection: TextDirection.rtl,
                        suffixIcon: const Icon(
                          Icons.library_books_outlined,
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
                          value.length > 10 ||
                          value.length < 10) {
                        return 'يتكون من 9 ارقام';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _phoneNumberController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
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
                        hintText: '  رقم الهاتف ',
                        hintTextDirection: TextDirection.rtl,
                        suffixIcon: const Icon(
                          Icons.phone_enabled_outlined,
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
                          value.length > 10 ||
                          value.length < 10) {
                        return 'يتكون من 10 ارقام';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14.7,
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
                              // !RegExp(r"^[a-zA-Z0-9_\-.]+@[a-z]+\.[a-z]")
                              .hasMatch(value)) {
                        return 'املئ الايميل ';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _addressController,
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
                        hintText: ' العنوان ',
                        hintTextDirection: TextDirection.rtl,
                        suffixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Color.fromARGB(255, 241, 213, 74),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 241, 213, 74),
                            ))),
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
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
                        suffixIcon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 241, 213, 74),
                        ),
                        // suffixIcon: GestureDetector(
                        //   onTap: (() {
                        //     setState(() {
                        //       obscreText = !obscreText;
                        //     });
                        //   }),
                        //   child: Icon(
                        //     obscreText == true
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //     color: Color.fromARGB(255, 241, 213, 74),
                        //   ),
                        // ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 241, 213, 74),
                            ))),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
                        return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
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
                        hintText: ' تاكيد كلمة المرور ',
                        hintTextDirection: TextDirection.rtl,
                        suffixIcon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 241, 213, 74),
                        ),
                        // suffixIcon: GestureDetector(
                        //   onTap: (() {
                        //     setState(() {
                        //       obscreText = !obscreText;
                        //     });
                        //   }),
                        //   child: Icon(
                        //     obscreText == true
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //     color: Color.fromARGB(255, 241, 213, 74),
                        //   ),
                        // ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 241, 213, 74),
                            ))),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
                        return 'يجب ان تتكون 8خانات على الاقل من رقم و حرف كبير وحرف صغير ورموز';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: openSigninScreen,
                      child: Text(
                        ' تسجيل الدخول ',
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
                  height: 40,
                ),
                Container(
                  width: 305,
                  height: 57,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Color.fromARGB(255, 241, 213, 74),
                        shape: StadiumBorder()),
                    onPressed: _signUp,
                    child: Center(
                        child: Text(
                      'تسجيل الاشتراك',
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
      ),
    );
  }
}
