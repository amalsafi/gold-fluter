import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoldPriceScreen(),
    );
  }
}

class GoldPriceScreen extends StatefulWidget {
  @override
  _GoldPriceScreenState createState() => _GoldPriceScreenState();
}

class _GoldPriceScreenState extends State<GoldPriceScreen> {
  String goldPrice = 'جاري التحميل...';

  @override
  void initState() {
    super.initState();
    fetchGoldPrice();
  }

  void fetchGoldPrice() async {
    try {
      final apiKey =
          'goldapi-rk4m1rlkm21kmr-io'; // استبدل بمفتاح API الخاص بك هنا
      final response =
          await http.get(Uri.parse('https://www.goldapi.io/api/XAU/$apiKey'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final price = jsonData['price'];
        setState(() {
          goldPrice = '$price دولار للأوقية';
        });
      } else {
        setState(() {
          goldPrice = 'فشل في جلب البيانات';
        });
      }
    } catch (e) {
      setState(() {
        goldPrice = 'حدث خطأ غير متوقع';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سعر الذهب اليومي'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'سعر الذهب: $goldPrice',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
