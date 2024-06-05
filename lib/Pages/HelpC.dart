import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/profile.dart';

class HelpC extends GetxController{

  getToHomePage() => Get.to(
        ()=>const MyHomePage(title: 'home'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );
  getToProfilePage() => Get.to(
        ()=>const ProfilePage(title: 'profile'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

}