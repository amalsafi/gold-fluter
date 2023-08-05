import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = '4ed47940bd39b5f496abd1bfa1fb37cf';
const String apiUrl = 'https://api.metalpriceapi.com';
const String symbol = "XAU";
const String currency = "USD";
const String displayCurrency = "JOD"; // الدينار الأردني
const String endpointUrl =
    '$apiUrl/v1/latest?api_key=$apiKey&base=$currency&currencies=$symbol';

class GoldScreen extends StatefulWidget {
  const GoldScreen({Key? key}) : super(key: key);

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  String _goldPrice = '';
  String _goldPriceInDinar = ''; // السعر بالدينار

  Map<String, double> goldPricesPerCarat = {}; // Map لتخزين أسعار العيارات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_goldPrice),
          Text(_goldPriceInDinar), // إضافة نص السعر بالدينار
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                  label:
                      Text('السعر بالدولار', textDirection: TextDirection.rtl)),
              DataColumn(
                  label:
                      Text('السعر بالدينار', textDirection: TextDirection.rtl)),
              DataColumn(
                  label: Text('العيار',
                      textDirection:
                          TextDirection.rtl)), // إضافة عنوان العملة بالدينار
            ],
            rows: goldPricesPerCarat.entries
                .map(
                  (entry) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${entry.value.toStringAsFixed(2)} \$',
                          textDirection:
                              TextDirection.rtl)), // استبدال "USD" بـ "\$"
                      DataCell(
                        FutureBuilder<double>(
                          future: calculatePriceInDinar(entry.value),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                  '${snapshot.data!.toStringAsFixed(2)} دينار',
                                  textDirection: TextDirection.rtl);
                            } else {
                              return Text('جاري الحساب...',
                                  textDirection: TextDirection.rtl);
                            }
                          },
                        ),
                      ),
                      DataCell(
                          Text(entry.key, textDirection: TextDirection.rtl)),
                    ],
                  ),
                )
                .toList(),
          ),
          Center(
            child: SizedBox(
              width: 220.0,
              height: 40.0,
              child: ElevatedButton(
                child: const Text('احصل على السعر'),
                onPressed: fetchGoldPrice,
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 218, 180, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ),

          // Center(
          //   child: ElevatedButton(
          //     onPressed: fetchGoldPrice,
          //     child: const Text('احصل على السعر'),
          //   ),
          // ),
        ],
      ),
    );
  }

  // دالة لجلب سعر الصرف بين الدينار والدولار من API
  Future<double> getExchangeRate() async {
    final exchangeRateEndpoint =
        'https://api.exchangerate-api.com/v4/latest/USD';
    final response = await http.get(Uri.parse(exchangeRateEndpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates'][displayCurrency];
    } else {
      throw Exception('Failed to fetch exchange rate');
    }
  }

  // دالة لحساب السعر بالدينار
  Future<double> calculatePriceInDinar(double priceInDollars) async {
    try {
      double exchangeRate = await getExchangeRate();
      double priceInDinar = priceInDollars * exchangeRate;
      return priceInDinar;
    } catch (error) {
      print(error);
      return 0;
    }
  }

  fetchGoldPrice() async {
    try {
      final response = await http.get(Uri.parse(endpointUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double goldPricePerOunce =
            1 / double.parse(data['rates']['XAU'].toString());
        double goldPricePerGram = goldPricePerOunce / 31.1035; // التحويل

        // تعريف أسعار العيارات وسعر الأونصة وسعر الكيلو
        goldPricesPerCarat = {
          'عيار 24': goldPricePerGram,
          'عيار 21': goldPricePerGram * 0.875,
          'عيار 22': goldPricePerGram * 0.9167,
          'عيار 18': goldPricePerGram * 0.75,
          'عيار 14': goldPricePerGram * 0.5833,
          'أونصة واحدة': goldPricePerOunce,
          'كيلوغرام واحد': goldPricePerGram * 1000,
        };

        setState(() {
          // استبدال "USD" بـ "\$"
        });
      } else {
        // التعامل مع حالة الخطأ
      }
    } catch (error) {
      print(error);
    }
  }
}
