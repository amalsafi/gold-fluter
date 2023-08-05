import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/signup.dart';

class Signout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(228, 187, 5, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            'تسجيل الخروج',
            style: TextStyle(
              color: Color.fromRGBO(228, 187, 5, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20.0),
        ]),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '?هل تريد تسجيل الخروج',
              style: TextStyle(
                color: Color.fromRGBO(228, 187, 5, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/logout.png',
              fit: BoxFit.cover,
              height: 250,
            ),
            SizedBox(
              width: 220.0,
              height: 40.0,
              child: ElevatedButton(
                child: Text('تسجيل خروج'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signup(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 218, 180, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
