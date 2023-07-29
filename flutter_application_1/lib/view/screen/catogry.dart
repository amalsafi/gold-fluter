// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/view/screen/Profilepersonly.dart';
// import 'ImageDetailsPage.dart';

// class catogry extends StatelessWidget {
//   final List<String> imageUrls = [
//     'assets/Group 1292.png',
//     'assets/Group 1293.png',
//     'assets/Group 1294.png',
//     'assets/Group 1295.png'
//     // Add more image URLs as needed.
//   ];

//   catogry({Key? key}) : super(key: key);

//   // Function to be executed when the menu icon is pressed
//   void onMenuPressed(BuildContext context) {
//     // Get the size of the screen
//     final screenSize = MediaQuery.of(context).size;

//     // Show a popup menu when menu icon is pressed
//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         screenSize.width - 100, // Adjust the x-coordinate as needed
//         80, // Adjust the top-coordinate as needed
//         screenSize.width, // Right boundary (end of the screen)
//         0, // Bottom boundary (we don't need any bottom boundary here)
//       ),
//       items: [
//         PopupMenuItem(
//           child: ListTile(
//             leading: Icon(
//               Icons.person,
//               color: Color.fromARGB(255, 235, 201, 26),
//             ),
//             title: Text(
//               'الملف الشخصي',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 235, 201, 26),
//               ),
//             ),
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => Profilepersonly(),
//                 ),
//               );
//             },
//           ),
//         ),
//         PopupMenuItem(
//           child: ListTile(
//             leading: Icon(
//               Icons.exit_to_app,
//               color: Color.fromARGB(255, 235, 201, 26),
//             ),
//             title: Text(
//               'تسجيل الخروج',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 235, 201, 26),
//               ),
//             ),
//             onTap: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ),
//       ],
//       elevation: 8.0,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Image(
//           image: AssetImage('assets/Group39.png'),
//           width: 40,
//           height: 40,
//         ),
//         actions: [
//           // Menu Icon (Hamburger Icon) to show the PopupMenu
//           IconButton(
//             icon: Icon(Icons.menu, color: Color.fromARGB(255, 241, 213, 74)),
//             iconSize: 30,
//             onPressed: () =>
//                 onMenuPressed(context), // Call onMenuPressed function here
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         // Adjust the number of columns based on the device width and orientation.
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//         ),
//         itemCount: imageUrls.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigator.push to the new page on image tap
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       ImageDetailsPage(imageUrl: imageUrls[index]),
//                 ),
//               );
//             },
//             child: Image(
//               image: AssetImage(
//                 imageUrls[index],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/BraceletsPage.dart';
import 'package:flutter_application_1/view/screen/EarringsPage.dart';
import 'package:flutter_application_1/view/screen/Profilepersonly.dart';
import 'package:flutter_application_1/view/screen/RingsPage.dart';
import 'package:flutter_application_1/view/screen/SanasilPage.dart';
import 'package:flutter_application_1/view/screen/signup.dart';
import 'package:flutter_application_1/view/screenowner/DisplayEarringsPage.dart';

// import 'RingsPage.dart'; // Import the RingsPage
// import 'BraceletsPage.dart'; // Import the BraceletsPage

class catogry extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/Group 1292.png',
    'assets/Group 1293.png',
    'assets/Group 1294.png',
    'assets/Group 1295.png'
    // Add more image URLs as needed.
  ];

  catogry({Key? key}) : super(key: key);

  // Function to be executed when the menu icon is pressed
  void onMenuPressed(BuildContext context) {
    // Get the size of the screen
    final screenSize = MediaQuery.of(context).size;

    // Show a popup menu when menu icon is pressed
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        screenSize.width - 100, // Adjust the x-coordinate as needed
        80, // Adjust the top-coordinate as needed
        screenSize.width, // Right boundary (end of the screen)
        0, // Bottom boundary (we don't need any bottom boundary here)
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.person,
              color: Color.fromARGB(255, 235, 201, 26),
            ),
            title: Text(
              'الملف الشخصي',
              style: TextStyle(
                color: Color.fromARGB(255, 235, 201, 26),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 235, 201, 26),
            ),
            title: Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: Color.fromARGB(255, 235, 201, 26),
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Signup(),
                ),
              );
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image(
          image: AssetImage('assets/Group39.png'),
          width: 40,
          height: 40,
        ),
        actions: [
          // Menu Icon (Hamburger Icon) to show the PopupMenu
          IconButton(
            icon: Icon(Icons.menu, color: Color.fromARGB(255, 241, 213, 74)),
            iconSize: 30,
            onPressed: () =>
                onMenuPressed(context), // Call onMenuPressed function here
          ),
        ],
      ),
      body: GridView.builder(
        // Adjust the number of columns based on the device width and orientation.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                // Navigate to RingsPage if the first category is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EarringsPage(),
                  ),
                );
              } else if (index == 1) {
                // Navigate to BraceletsPage if the second category is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SanasilPage(),
                  ),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RingsPage(),
                  ),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BraceletsPage(),
                  ),
                );
              }
              // Add more conditions for other categories if needed.
            },
            child: Image(
              image: AssetImage(
                imageUrls[index],
              ),
            ),
          );
        },
      ),
    );
  }
}