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
    super.key,
    required this.title,
  });

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {

    final HelpC a=Get.put(HelpC());

    return Scaffold(
      backgroundColor: Colors.grey[300],
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
              ],
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Instructions:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
            Text(
              'The App isn\'t ready yet lol',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 50),

            // Add github logo linking to individual github pages later

            Text(
              'Contributors:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Text(
              'Md. Aribur Rahman Dhruvo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'ID: 20220204003',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            Text(
              'Mohammad Yahya Bin Belal',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'ID: 20220204004',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            Text(
              'Nazim Raian Khan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'ID: 20220204026',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
