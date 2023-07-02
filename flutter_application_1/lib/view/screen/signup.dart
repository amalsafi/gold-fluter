import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/signin.dart';
import 'package:flutter_application_1/view/screen/signup1.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/signup.png')),
              SizedBox(
                height: 49.8,
              ),
              Container(
                width: 305,
                height: 57,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Color.fromARGB(255, 241, 213, 74),
                      shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Signin(),
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    'بائع',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 14.7,
              ),
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
                      shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Signup1(),
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    'زبون',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 241, 213, 74),
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
