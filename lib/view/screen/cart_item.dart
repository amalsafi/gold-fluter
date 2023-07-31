import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String name;
  final double price;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CartItem> get cartItems => _cartItems;

  Future<void> addToCart(CartItem item) async {
    _cartItems.add(item);
    notifyListeners();

    try {
      await _firestore.collection('cart').add(item.toMap());
    } catch (e) {
      print('Error adding item to Firestore: $e');
    }
  }

  Future<void> removeFromCart(CartItem item) async {
    _cartItems.remove(item);
    notifyListeners();

    try {
      await _firestore
          .collection('cart')
          .where('name', isEqualTo: item.name)
          .where('price', isEqualTo: item.price)
          .where('imageUrl', isEqualTo: item.imageUrl)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
    } catch (e) {
      print('Error removing item from Firestore: $e');
    }
  }
}


class CartItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final VoidCallback onRemove;

  CartItemWidget({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50),
        title: Text(name),
        subtitle: Text('السعر: $price'),
        trailing: ElevatedButton(
           style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 241, 213, 74), 
          elevation: 0, 
               ),
          onPressed: onRemove,
          child: Text('حذف'),
        ),
      ),
    );
  }
}
