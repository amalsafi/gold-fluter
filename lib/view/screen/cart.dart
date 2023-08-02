import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/cart_item.dart';
import 'package:flutter_application_1/view/screen/paypal.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class CartPage extends StatefulWidget {
  
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;
   
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
        leading: IconButton( 
          icon:Icon(Icons.arrow_back_ios),
          color:Color.fromRGBO(228, 187, 5, 1),
          onPressed:(){ Navigator.pop(context);}, ),
        title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ Text(      
                  'السلة' ,
                   style: TextStyle(
                   color: Color.fromRGBO(228, 187, 5, 1),
                   fontSize: 25,
                   fontWeight: FontWeight.bold,  
                   fontFamily: 'URWDINArabic',  
                       ),  ),
                   SizedBox(width: 20.0),
                   ] ), 
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          CartItem cartItem = cartItems[index];
          return CartItemWidget(
            name: cartItem.name,
            imageUrl: cartItem.imageUrl,
            price: cartItem.price,
            onRemove: () {
              Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItem);
            },
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text('انقر للدفع'),
        style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 218, 180, 28),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                        textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
        onPressed: () {
         Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                            builder: (context) => CheckoutPage(),),);  
        },
      ),
    );
  }
}
/*
void _showPaymentOptionsDialog(BuildContext context) {
  
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اختر طريقة الدفع'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('الدفع عند التوصيل'),
                leading: Radio(
                  value: PaymentOption.cashOnDelivery,
                  groupValue: _selectedPaymentOption,
                  onChanged: (PaymentOption? value) {
                    setState(() {
                      _selectedPaymentOption = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('الدفع ببطاقة الائتمان'),
                leading: Radio(
                 
                  value: PaymentOption.creditCard,
                  groupValue: _selectedPaymentOption,
                  onChanged: (PaymentOption? value) {
                    setState(() {
                      _selectedPaymentOption = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('الدفع عبر PayPal'),
                leading: Radio(
                  value: PaymentOption.payPal,
                  groupValue: _selectedPaymentOption,
                  onChanged: (PaymentOption? value) {
                    setState(() {
                      _selectedPaymentOption = value;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('إلغاء',
               style: TextStyle(
                color: Colors.black,
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('دفع'),
              style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 218, 180, 28),
                        ),
              onPressed: () {
                Navigator.of(context).pop();
                _showPaymentConfirmationDialog(context);
              },
            ),
          ],
        );
      },
    );
}
}
  void _showPaymentConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تمت عملية الدفع بنجاح'),
          content: Text('شكرًا لك على الشراء'),
          actions: [
            TextButton(
              child: Text('حسنًا', 
              style: TextStyle(
                color: Color.fromARGB(255, 218, 180, 28),
              ),),
              
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
enum PaymentOption {
  cashOnDelivery,
  creditCard,
  payPal,
}
PaymentOption? _selectedPaymentOption;
 */