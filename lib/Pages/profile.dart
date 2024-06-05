/*
 * @author: ARDhruvo
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/LoginC.dart';
import 'package:hotel_khujo/Pages/profileC.dart';
import 'package:hotel_khujo/RegC.dart';

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
//       home: const ProfilePage(title: 'Profile'),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  final String title;

  const ProfilePage({
    super.key,
    required this.title,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final profileC a=Get.put(profileC());

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
                DrawerHeader(child: Center(child: Text("Insert Icon here"))),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    a.getToHomePage();
                  }, //Home Page
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
                  leading: Icon(Icons.announcement),
                  title: Text("Helps and Services"),
                  onTap: () {
                    a.getToHelpPage();
                  }, //Help Page
                ),
              ],
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),

            // Replace with image uploading things

            Icon(
              Icons.account_circle,
              size: 150,
            ),

            Text(
              a.displayName()!.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 25),

            // Use firebase to fill in the names and ids

            Text(
              'Name: ${a.displayName()}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'Email: ${Get.find<LoginC>().mail.text}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'Account Status (Statistics and stuffs)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
