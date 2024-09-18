import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/Pages/favourite.dart';
import 'package:hotel_khujo/Pages/profile.dart';
import 'package:hotel_khujo/Pages/bookingPage.dart';
import 'Login.dart';
import 'Pages/help.dart';

class MyHomePageC extends GetxController{

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

  getTofavouritePage() => Get.to(
        ()=>const favourite(title: 'Favourite'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToBookingPage() => Get.to(
        ()=>BookingPage(),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToLoginPage() async{
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=> const Login(),
        transition: Transition.rightToLeft,
        duration: Durations.long1 );
  }

}