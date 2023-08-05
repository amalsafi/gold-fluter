import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/view/screenowner/AddBraceletsPage.dart';
import 'package:flutter_application_1/view/screenowner/AddEarringPage.dart';
import 'package:flutter_application_1/view/screenowner/AddSanasilPage.dart';

class DisplayBraceletsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 38,
        titleTextStyle: TextStyle(height: 2),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 30,
          color: Color.fromRGBO(228, 187, 5, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            ' اساور',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 53, horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Bracelets').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Bracelets = snapshot.data!.docs;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns in the grid
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: Bracelets.length,
                itemBuilder: (context, index) {
                  final Bracelet =
                      Bracelets[index].data() as Map<String, dynamic>;
                  return BraceletItem(
                    imageUrl: Bracelet['imageUrl'] as String?,
                    name: Bracelet['name'] as String,
                    price: Bracelet['price'] as double,
                    weight: Bracelet['weight'] as double,
                    carat: Bracelet['carat'] as double,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 241, 213, 74),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBraceletsPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BraceletItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double price;
  final double weight;
  final double carat;

  BraceletItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.weight,
    required this.carat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              imageUrl: imageUrl,
              name: name,
              price: price,
              weight: weight,
              carat: carat,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  final String? imageUrl;
  final String name;

  final double price;
  final double weight;
  final double carat;

  ProductDetailsPage({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.weight,
    required this.carat,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  double goldPrice21InDinar = 0.0;

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد أنك تريد حذف هذا المنتج؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق نافذة الحوار بدون حذف
              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  color:
                      Color.fromARGB(255, 241, 213, 74), // تغيير لون كلمة الغاء
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 241, 213, 74), // تغيير لون الزر إلى اللون المطلوب
              ),
              onPressed: () {
                deleteProduct(context); // حذف المنتج عند النقر على زر التأكيد
                Navigator.of(context).pop(); // إغلاق نافذة الحوار بعد الحذف
              },
              child: Text('تأكيد'),
            ),
          ],
        );
      },
    );
  }

  void deleteProduct(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Bracelets')
        .where('name', isEqualTo: widget.name)
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
        Navigator.popUntil(
            context,
            ModalRoute.withName(
                '/DisplayRingsPage')); // الرجوع إلى الشاشة السابقة بعد الحذف
      },
    ).catchError((error) {
      // معالجة أي أخطاء في حالة عدم تمكن من حذف المنتج
      print("Error deleting product: $error");
    });
  }

  @override
  void initState() {
    super.initState();
    fetchGoldPrice21();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 38,
        titleTextStyle: TextStyle(height: 2),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 30,
          color: Color.fromRGBO(228, 187, 5, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            ' التفاصيل',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 77),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.imageUrl != null)
                Image.network(widget.imageUrl!, width: 200, height: 200),
              SizedBox(height: 16),
              Text(
                widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'السعر: ${(goldPrice21InDinar + widget.price) * widget.weight} دينار',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'الوزن: ${widget.weight}', // عرض الوزن هنا
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'العيار: ${widget.carat}', // عرض العيار هنا
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 24),
              Container(
                width: 305,
                height: 57,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Color.fromARGB(255, 241, 213, 74),
                      shape: StadiumBorder()),
                  onPressed: () {
                    showDeleteConfirmationDialog(context);
                  },
                  child: Center(
                      child: Text(
                    ' حذف المنتج',
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
      ),
    );
  }

  fetchGoldPrice21() async {
    final apiKey = '4ed47940bd39b5f496abd1bfa1fb37cf';
    final apiUrl = 'https://api.metalpriceapi.com';
    final symbol = "XAU";
    final currency = "USD";
    final endpointUrl =
        '$apiUrl/v1/latest?api_key=$apiKey&base=$currency&currencies=$symbol';

    try {
      final response = await http.get(Uri.parse(endpointUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double exchangeRate = await getExchangeRate();
        double goldPricePerOunce =
            1 / double.parse(data['rates']['XAU'].toString());
        double goldPricePerGram = goldPricePerOunce / 31.1035;
        double goldPrice21 = goldPricePerGram * 0.875; // عيار 21
        double goldPrice21InDinar = goldPrice21 * exchangeRate;

        // تحويل الرقم إلى نص وتقليصه إلى 4 أرقام بعد الفاصلة العشرية
        String formattedPrice = goldPrice21InDinar.toStringAsFixed(2);

        setState(() {
          this.goldPrice21InDinar = double.parse(formattedPrice);
        });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('خطأ'),
              content: Text('حدث خطأ أثناء جلب سعر الجرام عيار 21.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('حسنًا'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print(error);
    }
  }

  Future<double> getExchangeRate() async {
    final exchangeRateEndpoint =
        'https://api.exchangerate-api.com/v4/latest/USD';
    final response = await http.get(Uri.parse(exchangeRateEndpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates']['JOD']; // الدينار الأردني
    } else {
      throw Exception('Failed to fetch exchange rate');
    }
  }
}
