import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/Pages/successful.dart';

class bookingPageC extends GetxController{
  // getToHotelDetailPage(Hotel hotel) =>Get.to(() => HotelDetailsPage(hotel: hotel));
  getToSuccessfulPage() => Get.to(
        ()=> successfullPage(),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  String? displayName(){
    final user = FirebaseAuth.instance.currentUser;
    return user?.displayName;
  }
}