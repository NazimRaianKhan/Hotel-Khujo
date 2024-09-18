
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/LoginC.dart';
import 'package:hotel_khujo/Pages/bookedC.dart';
import 'package:hotel_khujo/RegC.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
 
class Booked extends StatefulWidget {
  const Booked({Key? key}) : super(key: key);
 
  @override
  State<Booked> createState() => _BookedState();
}
 
class _BookedState extends State<Booked> {

  final bookedC a=Get.put(bookedC());
  
  Query dbRef = FirebaseDatabase.instance.ref().child('orders');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('orders');
  
  Widget listItem({required Map orders}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orders['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            orders['hotel'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            orders['numberOfPeople'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            orders['date'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 108, 0, 1),
        title: Text("Booked History"),
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
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
 
            Map orders = snapshot.value as Map;
            orders['key'] = snapshot.key;
 
            return listItem(orders: orders);
 
          },
        ),
      )
    );
  }
}