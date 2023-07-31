import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  final String imageUrl;

  ImageDetailsPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: Center(
        child: Image.asset(imageUrl),
      ),
    );
  }
}
