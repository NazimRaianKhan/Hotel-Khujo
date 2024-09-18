import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/profile.dart';

import '../Login.dart';

class HelpC extends GetxController{

  getToHomePage() => Get.to(
        ()=>const MyHomePage(title: 'Home'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );
  getToProfilePage() => Get.to(
        ()=>const ProfilePage(title: 'Profile'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToLoginPage() => Get.offAll(
        ()=>const Login(),
    transition: Transition.rightToLeft,
    duration: Durations.extralong1,
  );

}