import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/profile.dart';
import 'package:hotel_khujo/Pages/bookingPage.dart';
import '../Login.dart';
import 'help.dart';

class bookedC extends GetxController{

  getToProfilePage() => Get.to(
        ()=>const ProfilePage(title: 'Your Profile'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToHelpPage() => Get.to(
        ()=>const HelpPage(title: 'Helps and Services'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToHomePage() => Get.to(
        ()=>MyHomePage(title: 'Home',),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToLoginPage() => Get.offAll(
        ()=>const Login(),
    transition: Transition.rightToLeft,
    duration: Durations.extralong1,
  );

}