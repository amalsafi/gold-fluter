import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // تعريف الدالة لإظهار نافذة تأكيد الدفع كاش
  void _showCashPaymentConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' تأكيد الدفع '),
          content: const Text('هل ترغب في الدفع عند الإستلام؟'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'نعم',
                style: TextStyle(
                  color: Color.fromARGB(255, 218, 180, 28),
                ),
              ),
              onPressed: () {
                // إغلاق نافذة التأكيد واستدعاء دالة لإتمام العملية
                Navigator.of(context).pop();
                _completeCashPayment();
              },
            ),
            TextButton(
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _completeCashPayment() {
    print('تم دفع المبلغ كاش');
  }

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
            'الدفع',
            style: TextStyle(
              color: Color.fromRGBO(228, 187, 5, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'URWDINArabic',
            ),
          ),
          SizedBox(width: 20.0),
        ]),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/pay.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 60),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckout(
                    sandboxMode: true,
                    clientId:
                        "Ab6xg290IOTXcg_wxBqW1fOyIv_YCQSBQglaSZv2z9gVZX6JAqLotaE_R8X1PNUJDVw8CoylnJX_vww7",
                    secretKey:
                        "EBLpQD0IynMNqr67EIJKxJpfjAeIlcjp7ATOYdRAFUOdj_8xo2fvGI23SVfQnJ7eheX0Oe5c2zTT6siJ",
                    returnURL: "success.snippetcoder.com",
                    cancelURL: "cancel.snippetcoder.com",
                    transactions: const [
                      {
                        "amount": {
                          "total": '70',
                          "currency": "USD",
                          "details": {
                            "subtotal": '70',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list": {
                          "items": [
                            {
                              "name": "Apple",
                              "quantity": 4,
                              "price": '5',
                              "currency": "USD"
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '10',
                              "currency": "USD"
                            }
                          ],

                          // shipping address is not required though
                          //   "shipping_address": {
                          //     "recipient_name": "Raman Singh",
                          //     "line1": "Delhi",
                          //     "line2": "",
                          //     "city": "Delhi",
                          //     "country_code": "IN",
                          //     "postal_code": "11001",
                          //     "phone": "+00000000",
                          //     "state": "Texas"
                          //  },
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(228, 187, 5, 1),
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
              ),
              child: const Text('Paypal'),
            ),
            SizedBox(width: 60),
            const SizedBox(height: 200),
            TextButton(
                onPressed: () async {
                  _showCashPaymentConfirmationDialog();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(228, 187, 5, 1),
                  foregroundColor: Colors.white,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(1),
                    ),
                  ),
                ),
                child: Text('الدفع عند الإستلام',
                    style: TextStyle(color: Colors.white))),
          ]),
        ],
      ),
    );
  }
}
