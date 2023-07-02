import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/signup.dart';

class Forgetpasss extends StatelessWidget {
  Forgetpasss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/Group39.png')),
                SizedBox(
                  height: 41.8,
                ),
                Container(
                  width: 305,
                  height: 57,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(50),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          focusColor: Color.fromARGB(255, 241, 213, 74),
                          hintText: 'البريد الالكتروني ',
                          hintTextDirection: TextDirection.rtl,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 241, 213, 74),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              ))),
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
                        shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                    child: Center(
                        child: Text(
                      'ارسال',
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
        ));
  }
}
