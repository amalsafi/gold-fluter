import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  void _sendVerificationCode() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text,
        );
        _showSuccessDialog();
      } catch (e) {
        setState(() {
          _errorMessage = 'حدث خطأ أثناء إرسال رابط إعادة تعيين كلمة المرور';
        });
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('تم إرسال البريد الإلكتروني'),
        content:
            Text('تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.'),
        actions: <Widget>[
          TextButton(
            child: Text('حسناً'),
            onPressed: () {
              Navigator.of(ctx).pop();
              // يمكنك تنفيذ أي إجراءات إضافية هنا
            },
          ),
        ],
      ),
    );
  }

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text,
        );
        _sendVerificationCode();
      } catch (e) {
        setState(() {
          _errorMessage = 'حدث خطأ أثناء إرسال رابط إعادة تعيين كلمة المرور';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نسيت كلمة المرور'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }
                    // يمكنك أيضًا إضافة تحقق صحة بريد إلكتروني هنا
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('إرسال'),
                  onPressed: _sendVerificationCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
