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
//         _showSuccessDialog();
//       } catch (e) {
//         // حدث خطأ أثناء تغيير كلمة المرور
//         setState(() {
//           _errorMessage = 'حدث خطأ أثناء تغيير كلمة المرور';
//         });
//       }
//     }
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
//                 Navigator.of(context).pop();
//                 Navigator.of(context).pop();
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

//   void _changePassword1() async {
//     if (_isCurrentUserValid() && _areTextFieldsValid()) {
//       final user = _auth.currentUser;
//       final credential = EmailAuthProvider.credential(
//         email: user!.email!,
//         password: _oldPasswordController.text,
//       );

//       try {
//         await user.reauthenticateWithCredential(credential);
//         await user.updatePassword(_newPasswordController.text);
//         _showSuccessDialog();
//       } catch (e) {
//         setState(() {
//           _errorMessage = 'حدث خطأ أثناء تغيير كلمة المرور';
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تغيير كلمة المرور'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _oldPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'كلمة المرور القديمة'),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال كلمة المرور القديمة';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _newPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'كلمة المرور الجديدة'),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال كلمة المرور الجديدة';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               if (_errorMessage.isNotEmpty)
//                 Text(
//                   _errorMessage,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_isCurrentUserValid() && _areTextFieldsValid()) {
//                     _changePassword();

//                     _changePassword1();
//                   }
//                 },
//                 child: Text('تأكيد التغيير'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
