// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddRingPage extends StatefulWidget {
//   @override
//   _AddRingPageState createState() => _AddRingPageState();
// }

// class _AddRingPageState extends State<AddRingPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController weightController = TextEditingController();
//   TextEditingController caratController = TextEditingController();
//   File? imageFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         titleSpacing: 38,
//         titleTextStyle: TextStyle(height: 2),
//         leading: IconButton(
//           icon: Icon(Icons.chevron_left_rounded),
//           iconSize: 30,
//           color: Color.fromRGBO(228, 187, 5, 1),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Align(
//           alignment: Alignment.bottomRight,
//           child: Text(
//             ' اضافة منتج',
//             textDirection: TextDirection.rtl,
//             textAlign: TextAlign.right,
//             style: TextStyle(
//               color: Color.fromARGB(255, 235, 201, 26),
//               fontSize: 30,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 77, horizontal: 44),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: imageFile != null
//                       ? Image.file(
//                           imageFile!,
//                           fit: BoxFit.cover,
//                         )
//                       : IconButton(
//                           icon: Icon(Icons.camera_alt),
//                           onPressed: () {
//                             pickImage();
//                           },
//                         ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Directionality(
//                 textDirection:
//                     TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
//                 child: TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'اسم المنتج',
//                     labelStyle: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(255, 235, 201, 26),
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     focusedErrorBorder: InputBorder.none,
//                   ),
//                   cursorColor: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Directionality(
//                 textDirection:
//                     TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
//                 child: TextFormField(
//                   controller: weightController,
//                   decoration: InputDecoration(
//                     labelText: 'الوزن',
//                     labelStyle: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(255, 235, 201, 26),
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     focusedErrorBorder: InputBorder.none,
//                   ),
//                   keyboardType: TextInputType.number,
//                   cursorColor: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Directionality(
//                 textDirection:
//                     TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
//                 child: TextFormField(
//                   controller: caratController,
//                   decoration: InputDecoration(
//                     labelText: 'العيار',
//                     labelStyle: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(255, 235, 201, 26),
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     focusedErrorBorder: InputBorder.none,
//                   ),
//                   cursorColor: Colors.black,
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Directionality(
//                 textDirection:
//                     TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
//                 child: TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(
//                     labelText: 'السعر',
//                     labelStyle: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(255, 235, 201, 26),
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     focusedErrorBorder: InputBorder.none,
//                   ),
//                   keyboardType: TextInputType.number,
//                   cursorColor: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 24),
//               Container(
//                 width: 305,
//                 height: 57,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                       elevation: 3,
//                       backgroundColor: Color.fromARGB(255, 241, 213, 74),
//                       shape: StadiumBorder()),
//                   onPressed: () {
//                     addRing();
//                   },
//                   child: Center(
//                       child: Text(
//                     'اضافة منتج',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void pickImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       setState(() {
//         imageFile = File(pickedImage.path);
//       });
//     }
//   }

//   void addRing() {
//     String name = nameController.text;
//     double price = double.tryParse(priceController.text) ?? 0.0;
//     double weight = double.tryParse(weightController.text) ?? 0.0;
//     double carat = double.tryParse(caratController.text) ?? 0.0;

//     if (name.isNotEmpty && price > 0 && imageFile != null) {
//       FirebaseFirestore.instance.collection('rings').add({
//         'name': name,
//         'price': price,
//         'weight': weight,
//         'carat': carat,
//         'imageUrl': '', // Add the image download URL here
//       });

//       nameController.clear();
//       priceController.clear();
//       weightController.clear();
//       caratController.clear();
//       setState(() {
//         imageFile = null;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('تمت إضافة المنتج بنجاح!')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('يرجى إدخال بيانات صحيحة واختيار صورة!')),
//       );
//     }
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRingPage extends StatefulWidget {
  @override
  _AddRingPageState createState() => _AddRingPageState();
}

class _AddRingPageState extends State<AddRingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController caratController = TextEditingController();
  File? imageFile;

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
            ' اضافة منتج',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 77, horizontal: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: imageFile != null
                      ? Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {
                            pickImage();
                          },
                        ),
                ),
              ),
              SizedBox(height: 16),
              Directionality(
                textDirection:
                    TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'اسم المنتج',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 235, 201, 26),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Directionality(
                textDirection:
                    TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
                child: TextFormField(
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: 'الوزن',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 235, 201, 26),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Directionality(
                textDirection:
                    TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
                child: TextFormField(
                  controller: caratController,
                  decoration: InputDecoration(
                    labelText: 'العيار',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 235, 201, 26),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 16),
              Directionality(
                textDirection:
                    TextDirection.rtl, // اتجاه النصوص يكون من اليمين إلى اليسار
                child: TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'السعر',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 235, 201, 26),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                ),
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
                    addRing();
                  },
                  child: Center(
                      child: Text(
                    'اضافة منتج',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),

              // ... (existing code)
            ],
          ),
        ),
      ),
    );
  }

  Future<String> uploadImageToFirebase(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(image);
    firebase_storage.TaskSnapshot storageSnapshot = await uploadTask;

    return await storageSnapshot.ref.getDownloadURL();
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  void addRing() async {
    String name = nameController.text;
    double price = double.tryParse(priceController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double carat = double.tryParse(caratController.text) ?? 0.0;

    if (name.isNotEmpty && price > 0 && imageFile != null) {
      String imageUrl = await uploadImageToFirebase(imageFile!);

      FirebaseFirestore.instance.collection('rings').add({
        'name': name,
        'price': price,
        'weight': weight,
        'carat': carat,
        'imageUrl': imageUrl, // Add the image download URL here
      });

      nameController.clear();
      priceController.clear();
      weightController.clear();
      caratController.clear();
      setState(() {
        imageFile = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت إضافة المنتج بنجاح!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى إدخال بيانات صحيحة واختيار صورة!')),
      );
    }
  }
}
