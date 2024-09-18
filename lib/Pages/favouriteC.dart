import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/help.dart';
import 'package:hotel_khujo/Pages/profile.dart';

import '../Login.dart';

class favouriteC extends GetxController{

  var favorites = <Hotel>[].obs;

  void toggleFavorite(Hotel hotel) {
    if (favorites.contains(hotel)) {
      favorites.remove(hotel);
    } else {
      favorites.add(hotel);
    }
  }

  bool isFavorite(Hotel hotel) {
    return favorites.contains(hotel);
  }

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

  getToHelpPage() => Get.to(
        ()=>const HelpPage(title: 'Helps and Services'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToLoginPage() => Get.offAll(
        ()=>const Login(),
    transition: Transition.rightToLeft,
    duration: Durations.extralong1,
  );

}