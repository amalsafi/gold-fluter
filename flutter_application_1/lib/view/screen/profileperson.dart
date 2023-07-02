// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePage2State createState() => _HomePage2State();
// }

// class _HomePage2State extends State<HomePage2> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   void fetchUserData() async {
//     String userId =
//         'أيدي المستخدم الحالي'; // قم بتعيين هنا معرّف المستخدم الحالي
//     DocumentSnapshot snapshot =
//         await FirebaseFirestore.instance.collection('users').doc(userId).get();

//     if (snapshot.exists) {
//       Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
//       nameController.text = userData['name'];
//       emailController.text = userData['email'];
//     }
//   }

//   void updateUser() async {
//     String userId =
//         'أيدي المستخدم الحالي'; // قم بتعيين هنا معرّف المستخدم الحالي
//     await FirebaseFirestore.instance.collection('users').doc(userId).update({
//       'name': nameController.text,
//       'email': emailController.text,
//     });

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('تم تحديث المعلومات بنجاح'),
//           actions: [
//             FlatButton(
//               child: Text('حسناً'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تحرير المعلومات الشخصية'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'الاسم',
//               ),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'البريد الإلكتروني',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             RaisedButton(
//               child: Text('تحديث'),
//               onPressed: updateUser,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
