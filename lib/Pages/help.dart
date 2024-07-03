/*
 * @author: ARDhruvo
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Pages/HelpC.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HelpPage(title: 'Helps and Services'),
//     );
//   }
// }

class HelpPage extends StatefulWidget {
  final String title;

  const HelpPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    final HelpC a=Get.put(HelpC());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 108, 0, 1),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Container(
            color: const Color.fromRGBO(255, 183, 77, 1),
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Image.asset('assets/logo1.png'))),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    a.getToHomePage();
                  }, //Home Page
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Profile"),
                  onTap: () {
                    a.getToProfilePage();
                  }, //Profile Page
                ),
                ListTile(
                  leading: Icon(Icons.assignment_turned_in),
                  title: Text("Booked"),
                  onTap: () {}, //Booked Page
                ),
                ListTile(
                  leading: Icon(Icons.favorite_outlined),
                  title: Text("Favorites"),
                  onTap: () {}, //Favorite Page
                ),
                ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("Sign Out"),
                  onTap: () {
                    a.getToLoginPage();
                  }, // Sign Out
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Contributors:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              buildImageItem('assets/founder3.jpg', 'Dhruvo'),
              const Text(
                'ID: 20220204003',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              buildImageItem('assets/founder4.jpg', 'Yahya'),
              const Text(
                'ID: 20220204004',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              buildImageItem('assets/founder26.jpg', 'Nazim'),
              const Text(
                'ID: 20220204026',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageItem(String imagePath, String imageLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          imageLabel,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}