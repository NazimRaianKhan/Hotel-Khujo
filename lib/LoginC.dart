
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/reg.dart';

class LoginC extends GetxController{
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
  loginMessageShow() => print('Pressed Login');
  regMessageShow() => print('Pressed Register');
  getToRegPage() => Get.to(
      ()=>const Register(title: 'Regi'),
      transition: Transition.downToUp,
      duration: Durations.long1,
  );
  getToHomePage() => Get.to(
      ()=>const MyHomePage(title: 'Home'),
    transition: Transition.downToUp,
    duration: Durations.long1,
  );

  Future<void> singIn(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail.text,
        password: pass.text,
      );
      getToHomePage();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to sign in. Please check your credentials.')
          ));
    };
  }
}