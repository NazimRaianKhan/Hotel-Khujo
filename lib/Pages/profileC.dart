import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/help.dart';

import '../Login.dart';

class profileC extends GetxController{

  getToHomePage() => Get.to(
        ()=>const MyHomePage(title: 'home'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );
  getToHelpPage() => Get.to(
        ()=>const HelpPage(title: 'help'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToLoginPage() => Get.offAll(
        ()=>const Login(),
    transition: Transition.rightToLeft,
    duration: Durations.extralong1,
  );

  String? displayName(){
    final user = FirebaseAuth.instance.currentUser;
    return user?.displayName;
  }

}