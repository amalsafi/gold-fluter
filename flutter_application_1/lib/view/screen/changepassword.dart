// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ChangePasswordPage extends StatefulWidget {
//   @override
//   _ChangePasswordPageState createState() => _ChangePasswordPageState();
// }

// class _ChangePasswordPageState extends State<ChangePasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _oldPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _auth = FirebaseAuth.instance;
//   String _errorMessage = '';

//   void _changePassword() async {
//     if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//       final user = _auth.currentUser;
//       final credential = EmailAuthProvider.credential(
//         email: user!.email!,
//         password: _oldPasswordController.text,
//       );

//       try {
//         await user.reauthenticateWithCredential(credential);
//         await user.updatePassword(_newPasswordController.text);
//         // تم تغيير كلمة المرور بنجاح
//         _showSuccessDialog(); // عرض دايلوج النجاح
//         Navigator.pop(context);
//       } catch (e) {
//         // حدث خطأ أثناء تغيير كلمة المرور
//         _showErrorDialog('حدث خطأ أثناء تغيير كلمة المرور');
//       }
//     }
//   }

//   void _showErrorDialog(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('خطأ'),
//           content: Text(errorMessage),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('حسناً'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('تمت العملية بنجاح'),
//           content: Text('تم تغيير كلمة المرور بنجاح.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // إغلاق رسالة النجاح
//                 Navigator.of(context).pop(); // إغلاق صفحة تغيير كلمة المرور
//               },
//               child: Text('موافق'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   bool _isCurrentUserValid() {
//     final user = _auth.currentUser;
//     return user != null;
//   }

//   bool _areTextFieldsValid() {
//     final oldPassword = _oldPasswordController.text;
//     final newPassword = _newPasswordController.text;
//     return oldPassword.isNotEmpty && newPassword.isNotEmpty;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         titleSpacing: 38,
//         titleTextStyle: TextStyle(height: 2),
//         leading: IconButton(
//           icon: Icon(Icons.chevron_left_rounded),
//           iconSize: 30,
//           color: Color.fromRGBO(228, 187, 5, 1),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Align(
//           alignment: Alignment.bottomRight,
//           child: Text(
//             ' تغيير كلمة المرور',
//             textDirection: TextDirection.rtl,
//             textAlign: TextAlign.right,
//             style: TextStyle(
//               color: Color.fromARGB(255, 235, 201, 26),
//               fontSize: 30,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: Material(
//                     elevation: 3,
//                     borderRadius: BorderRadius.circular(50),
//                     child: TextField(
//                       controller: _oldPasswordController,
//                       obscureText: true,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                         focusedBorder: InputBorder.none,
//                         focusColor: Color.fromARGB(255, 241, 213, 74),
//                         hintText: 'كلمة المرور القديمة',
//                         hintTextDirection: TextDirection.rtl,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 14.7,
//                 ),
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: Material(
//                     elevation: 3,
//                     borderRadius: BorderRadius.circular(50),
//                     child: TextField(
//                       controller: _newPasswordController,
//                       obscureText: true,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                         focusedBorder: InputBorder.none,
//                         focusColor: Color.fromARGB(255, 241, 213, 74),
//                         hintText: 'كلمة المرور الجديدة',
//                         hintTextDirection: TextDirection.rtl,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 if (_errorMessage.isNotEmpty)
//                   Text(
//                     _errorMessage,
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       elevation: 3,
//                       backgroundColor: Color.fromARGB(255, 241, 213, 74),
//                       shape: StadiumBorder(),
//                     ),
//                     onPressed: () {
//                       if (_isCurrentUserValid() && _areTextFieldsValid()) {
//                         _changePassword();
//                       }
//                     },
//                     child: Center(
//                       child: Text(
//                         'تغيير',
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _changePassword() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final user = _auth.currentUser;
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: _oldPasswordController.text,
      );

      try {
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(_newPasswordController.text);
        _showSuccessDialog();
      } catch (e) {
        _showErrorDialog('حدث خطأ أثناء تغيير كلمة المرور');
      }
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(errorMessage),
          actions: [
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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تمت العملية بنجاح'),
          content: Text('تم تغيير كلمة المرور بنجاح.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق رسالة النجاح
                Navigator.of(context).pop(); // العودة للصفحة السابقة
              },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }

  bool _isCurrentUserValid() {
    final user = _auth.currentUser;
    return user != null;
  }

  bool _areTextFieldsValid() {
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    return oldPassword.isNotEmpty && newPassword.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 38,
        titleTextStyle: TextStyle(height: 2),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 30,
          color: Color.fromRGBO(228, 187, 5, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            ' تغيير كلمة المرور',
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
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 305,
                  height: 57,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(50),
                    child: TextField(
                      controller: _oldPasswordController,
                      obscureText: true,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        focusColor: Color.fromARGB(255, 241, 213, 74),
                        hintText: 'كلمة المرور القديمة',
                        hintTextDirection: TextDirection.rtl,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 241, 213, 74),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.7,
                ),
                Container(
                  width: 305,
                  height: 57,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(50),
                    child: TextField(
                      controller: _newPasswordController,
                      obscureText: true,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        focusColor: Color.fromARGB(255, 241, 213, 74),
                        hintText: 'كلمة المرور الجديدة',
                        hintTextDirection: TextDirection.rtl,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 241, 213, 74),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      if (_isCurrentUserValid() && _areTextFieldsValid()) {
                        _changePassword();
                      }
                    },
                    child: Center(
                      child: Text(
                        'تغيير',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
