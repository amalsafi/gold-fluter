import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/Profilepersonly.dart';

class changepassword extends StatelessWidget {
  changepassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
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
            child: Column(
              children: [
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
                          hintText: 'كلمة المرور القديمة ',
                          hintTextDirection: TextDirection.rtl,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              ))),
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
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          focusColor: Color.fromARGB(255, 241, 213, 74),
                          hintText: ' كلمة المرور الجديدة',
                          hintTextDirection: TextDirection.rtl,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 213, 74),
                              ))),
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
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          focusColor: Color.fromARGB(255, 241, 213, 74),
                          hintText: ' تاكيد كلمة المرور الجديدة',
                          hintTextDirection: TextDirection.rtl,
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
                          builder: (context) => Profilepersonly(),
                        ),
                      );
                    },
                    child: Center(
                        child: Text(
                      ' تغيير',
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
