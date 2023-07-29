import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/view/screen/Profilepersonly.dart';
import 'package:flutter_application_1/view/screen/changepassword.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Customers');

  // Create variables to hold the updated data
  String? updatedUsername;
  String? updatedAddress;
  String? updatedPhoneNumber;
  String? updatedIdNumber;

  void _updateUserData(BuildContext context) async {
    // Create a map to store only the updated data
    Map<String, dynamic> updatedData = {};

    // Check if the data has changed and add it to the map
    if (updatedUsername != null) {
      updatedData['username'] = updatedUsername;
    }

    if (updatedAddress != null) {
      updatedData['address'] = updatedAddress;
    }

    if (updatedPhoneNumber != null) {
      updatedData['phoneNumber'] = updatedPhoneNumber;
    }

    if (updatedIdNumber != null) {
      updatedData['idNumber'] = updatedIdNumber;
    }

    try {
      if (updatedData.isNotEmpty) {
        await usersCollection.doc(user!.uid).update(updatedData);
      }
      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('تم التحديث'),
            content: Text('تم تحديث بيانات المستخدم بنجاح.'),
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
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('خطأ'),
            content: Text('حدث خطأ أثناء تحديث البيانات.'),
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
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Color.fromARGB(255, 235, 201, 26),
          size: 30,
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
                          onChanged: (value) => updatedUsername = value,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintText: ' ${userData['username']}',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.person_outline_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
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
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          onChanged: (value) => updatedAddress = value,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintText: ' ${userData['address']}',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
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
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          onChanged: (value) => updatedPhoneNumber = value,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintText: '  ${userData['phoneNumber']}  ',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.phone_enabled_outlined,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
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
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          onChanged: (value) => updatedIdNumber = value,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            focusColor: Color.fromARGB(255, 241, 213, 74),
                            hintText: ' ${userData['idNumber']}  ',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: const Icon(
                              Icons.credit_card,
                              color: Color.fromARGB(255, 241, 213, 74),
                            ),
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
                    SizedBox(height: 14.7),
                    Container(
                      width: 305,
                      height: 57,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          primary: Color.fromARGB(255, 241, 213, 74),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () => _updateUserData(context),
                        child: Center(
                          child: Text(
                            'تحديث البيانات',
                            style: TextStyle(
                              fontSize: 15,
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
            );
          },
        ),
      ),
    );
  }
}
