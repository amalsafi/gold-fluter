import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
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
            'لتواصل',
            style: TextStyle(
              color: Color.fromRGBO(228, 187, 5, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20.0),
        ]),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/contact_image.png',
            fit: BoxFit.cover,
            height: 250,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                  ),
                  Text('050999300'),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // add functionality for Facebook button here
                    },
                  ),
                  Text('Facebook'),
                ],
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
