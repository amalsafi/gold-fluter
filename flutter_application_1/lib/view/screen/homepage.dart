import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/signin.dart';
import 'package:flutter_application_1/view/screen/signup.dart';
import 'package:flutter_application_1/view/widget/mybutton.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/Group39.png')),
              SizedBox(
                height: 49.8,
              ),
              Container(
                width: 305,
                height: 57,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => Signup(),
                    //   ),
                    // );
                  },
                  style: OutlinedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Color.fromARGB(255, 241, 213, 74),
                      shape: StadiumBorder()),
                  child: Center(
                      child: Text(
                    "تسجيل الاشتراك",
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
                        builder: (context) => Signin(),
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    'تسجيل الدخول',
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
