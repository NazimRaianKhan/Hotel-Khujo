import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Pages/successfulC.dart';

class successfullPage extends StatelessWidget {

  final SuccessfulPageC a=Get.put(SuccessfulPageC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/verified.gif', // Replace with your GIF image path
              height: 200, // Adjust height as needed
            ),
            SizedBox(height: 20),
            Text(
              'Successfully Added to the List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                a.getToHomePage();
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity,50),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: const Text('Done'),
            ),

          ],
        ),
      ),
    );
  }
}
