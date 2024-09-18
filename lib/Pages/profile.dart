/*
 * @author: ARDhruvo
 */

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/LoginC.dart';
import 'package:hotel_khujo/Pages/profileC.dart';
import 'package:hotel_khujo/RegC.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

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

  final profileC a=Get.put(profileC());

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Obx(() => GestureDetector(
              onTap: () => _changeProfileImage(context),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: Get.find<profileC>().profileImageUrl != ''
                    ? NetworkImage(Get.find<profileC>().profileImageUrl!)
                    : AssetImage('assets/default_profile_image.jpg') as ImageProvider,
              ),
            )),
            const SizedBox(height: 25),
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

          ],
        ),
      ),
    );
  }
  Future<void> _changeProfileImage(BuildContext context) async {
    print('Tapped CircleAvatar');
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String fileName = path.basename(imageFile.path);

      try {
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child(fileName);

        firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
        firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
        String imageUrl = await taskSnapshot.ref.getDownloadURL();

        Get.find<profileC>().updateProfileImage(imageUrl);
      } catch (e) {
        print('Failed to upload profile image: $e');
        // Handle error
      }
    } else {
      print('No image selected.');
    }
  }
}
