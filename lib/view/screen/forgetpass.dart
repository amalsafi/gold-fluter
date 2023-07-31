import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgetpasss extends StatefulWidget {
  @override
  _ForgetpasssState createState() => _ForgetpasssState();
}

class _ForgetpasssState extends State<Forgetpasss> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    final email = _emailController.text.trim();

    try {
      await _auth.sendPasswordResetEmail(email: email);
      // تم إرسال رابط إعادة تعيين كلمة المرور بنجاح
      _showDialog('تمت العملية بنجاح',
          'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.');
    } catch (e) {
      // حدث خطأ أثناء إرسال البريد الإلكتروني
      _showDialog('حدث خطأ', 'حدث خطأ أثناء إرسال البريد الإلكتروني.');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الحوار
              },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إعادة تعيين كلمة المرور'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetPassword,
                child: Text('إرسال رابط إعادة تعيين كلمة المرور'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
