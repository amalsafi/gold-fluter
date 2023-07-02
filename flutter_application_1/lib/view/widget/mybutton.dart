import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 57,
      child: OutlinedButton(
        onPressed: () {
          onPressed;
        },
        style: OutlinedButton.styleFrom(
            elevation: 3,
            backgroundColor: Color.fromARGB(255, 241, 213, 74),
            shape: StadiumBorder()),
        child: Center(
            child: Text(
          name,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
