// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/view/screen/changepass.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Profilepersonly extends StatelessWidget {
//   Profilepersonly({Key? key}) : super(key: key);
//   final user = FirebaseAuth.instance.currentUser!;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           toolbarHeight: 70,
//           titleSpacing: 38,
//           titleTextStyle: TextStyle(height: 2),
//           leading: Icon(
//             Icons.chevron_left_rounded,
//             color: Color.fromARGB(255, 235, 201, 26),
//             size: 30,
//           ),
//           title: Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               ' الملف الشخصي',
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
//             child: Column(
//               children: [
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: Material(
//                     elevation: 3,
//                     borderRadius: BorderRadius.circular(50),
//                     child: TextField(
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           focusedBorder: InputBorder.none,
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: 'اسم المستخدم',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.person_outline_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
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
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           focusedBorder: InputBorder.none,
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: ' العنوان',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.location_on_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
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
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           focusedBorder: InputBorder.none,
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: '  رقم الهاتف ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.phone_enabled_outlined,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
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
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           focusedBorder: InputBorder.none,
//                           focusColor: Color.fromARGB(255, 241, 213, 74),
//                           hintText: ' رقم البطاقة ',
//                           hintTextDirection: TextDirection.rtl,
//                           suffixIcon: const Icon(
//                             Icons.credit_card,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 213, 74),
//                               ))),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 14.7,
//                 ),
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                         elevation: 3,
//                         backgroundColor: Colors.white,
//                         side: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                           width: 1,
//                         ),
//                         shape: StadiumBorder()),
//                     onPressed: () {
//                       FirebaseAuth.instance.signOut();
//                     },
//                     child: Center(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           Icons.chevron_left_sharp,
//                           textDirection: TextDirection.ltr,
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                         Text(
//                           'تغيير كلمة المرور',
//                           style: TextStyle(
//                               fontSize: 15,
//                               color: Color.fromARGB(255, 241, 213, 74),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(user.email!)
//                       ],
//                     )),
//                   ),
//                 ),
//                 Container(
//                   width: 305,
//                   height: 57,
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                         elevation: 3,
//                         backgroundColor: Colors.white,
//                         side: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                           width: 1,
//                         ),
//                         shape: StadiumBorder()),
//                     onPressed: () {
//                       FirebaseAuth.instance.signOut();
//                     },
//                     child: Center(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           Icons.chevron_left_sharp,
//                           textDirection: TextDirection.ltr,
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                         Text(user.phoneNumber!)
//                       ],
//                     )),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => ChangePasswordPage(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'هل نسيت كلمة المرور؟',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Color.fromARGB(255, 241, 213, 74),
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/view/screen/changepassword.dart';
import 'package:flutter_application_1/view/screen/updateProfileperson.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ' الملف الشخصي',
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
        child: StreamBuilder<DocumentSnapshot>(
          stream: usersCollection.doc(user!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('حدث خطأ أثناء جلب المعلومات.'));
            }

            if (!snapshot.hasData) {
              return Center(child: Text('لا يوجد بيانات.'));
            }

            Map<String, dynamic> userData =
                snapshot.data!.data() as Map<String, dynamic>;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 68),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          enabled: false,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: ' ${userData['username']}',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(158, 13, 0, 0),
                            ),
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.person_outline_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          enabled: false,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: ' ${userData['address']}',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(158, 13, 0, 0),
                            ),
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          enabled: false,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: ' ${userData['phoneNumber']}',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(158, 13, 0, 0),
                            ),
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.phone_enabled_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          enabled: false,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: ' ${userData['idNumber']}',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(158, 13, 0, 0),
                            ),
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.credit_card,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Color.fromARGB(255, 241, 213, 74),
                            width: 1,
                          ),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangePasswordPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.password,
                                textDirection: TextDirection.ltr,
                                color: Color.fromARGB(255, 241, 213, 74),
                              ),
                              Text(
                                'تغيير كلمة المرور',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 241, 213, 74),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(user!.email!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Color.fromARGB(255, 241, 213, 74),
                            width: 1,
                          ),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdateProfilePage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.update,
                                textDirection: TextDirection.ltr,
                                color: Color.fromARGB(255, 241, 213, 74),
                              ),
                              Text(
                                'تعديل البيانات ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 241, 213, 74),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(user!.email!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



// class Profilepersonly extends StatefulWidget {
//   @override
//   _ProfilepersonlyState createState() => _ProfilepersonlyState();
// }

// class _ProfilepersonlyState extends State<Profilepersonly> {
//   final User? user = FirebaseAuth.instance.currentUser;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final CollectionReference usersCollection =
//       FirebaseFirestore.instance.collection('users');

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController IdentificationController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     IdentificationController.dispose();
//     super.dispose();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       DocumentSnapshot documentSnapshot =
//           await usersCollection.doc(user!.uid).get();
//       if (documentSnapshot.exists) {
//         Map<String, dynamic> userData =
//             documentSnapshot.data() as Map<String, dynamic>;
//         setState(() {
//           nameController.text = userData['name'];
//           emailController.text = userData['email'];
//           phoneController.text = userData['phone'];
//           IdentificationController.text = userData['Identification'];
//         });
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         titleSpacing: 38,
//         titleTextStyle: TextStyle(height: 2),
//         leading: Icon(
//           Icons.chevron_left_rounded,
//           color: Color.fromARGB(255, 235, 201, 26),
//           size: 30,
//         ),
//         title: Align(
//           alignment: Alignment.bottomRight,
//           child: Text(
//             ' الملف الشخصي',
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
//           child: Column(
//             children: [
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(50),
//                   child: TextField(
//                     controller: nameController,
//                     enabled: false,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       focusedBorder: InputBorder.none,
//                       focusColor: Color.fromARGB(255, 241, 213, 74),
//                       hintTextDirection: TextDirection.rtl,
//                       suffixIcon: const Icon(
//                         Icons.person_outline_outlined,
//                         color: Color.fromARGB(255, 241, 213, 74),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 14.7),
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(50),
//                   child: TextField(
//                     controller: emailController,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       focusedBorder: InputBorder.none,
//                       focusColor: Color.fromARGB(255, 241, 213, 74),
//                       hintText: ' العنوان',
//                       hintTextDirection: TextDirection.rtl,
//                       suffixIcon: const Icon(
//                         Icons.location_on_outlined,
//                         color: Color.fromARGB(255, 241, 213, 74),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 14.7),
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(50),
//                   child: TextField(
//                     controller: phoneController,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       focusedBorder: InputBorder.none,
//                       focusColor: Color.fromARGB(255, 241, 213, 74),
//                       hintText: ' رقم الهاتف ',
//                       hintTextDirection: TextDirection.rtl,
//                       suffixIcon: const Icon(
//                         Icons.phone_enabled_outlined,
//                         color: Color.fromARGB(255, 241, 213, 74),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 14.7),
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(50),
//                   child: TextField(
//                     controller: IdentificationController,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       focusedBorder: InputBorder.none,
//                       focusColor: Color.fromARGB(255, 241, 213, 74),
//                       hintText: ' رقم البطاقة ',
//                       hintTextDirection: TextDirection.rtl,
//                       suffixIcon: const Icon(
//                         Icons.credit_card,
//                         color: Color.fromARGB(255, 241, 213, 74),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 14.7),
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     elevation: 3,
//                     backgroundColor: Colors.white,
//                     side: BorderSide(
//                       color: Color.fromARGB(255, 241, 213, 74),
//                       width: 1,
//                     ),
//                     shape: StadiumBorder(),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => changePasswordPage(),
//                       ),
//                     );
//                   },
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           Icons.chevron_left_sharp,
//                           textDirection: TextDirection.ltr,
//                           color: Color.fromARGB(255, 241, 213, 74),
//                         ),
//                         Text(
//                           'تغيير كلمة المرور',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color.fromARGB(255, 241, 213, 74),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         // Text(user!.email!),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // Row(
//               //   children: [
//               //     GestureDetector(
//               //       onTap: () {
//               //         Navigator.of(context).push(
//               //           MaterialPageRoute(
//               //             builder: (context) => ChangePasswordPage(),
//               //           ),
//               //         );
//               //       },
//               //       child: Text(
//               //         'هل نسيت كلمة المرور؟',
//               //         style: TextStyle(
//               //           fontSize: 15,
//               //           color: Color.fromARGB(255, 241, 213, 74),
//               //           decoration: TextDecoration.underline,
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
