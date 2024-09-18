import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/Pages/favourite.dart';
import 'package:hotel_khujo/Pages/help.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Login.dart';

class profileC extends GetxController{

  var isSet = false.obs;
  var _profileImageUrl = ''.obs;

  String? get profileImageUrl => _profileImageUrl.value;

  Future<void> updateProfileImage(String imageUrl) async {
    _profileImageUrl.value = imageUrl;
    isSet.value=true;

    final prefs=await SharedPreferences.getInstance();
    await prefs.setString('profileImageUrl',imageUrl);

  }

  Future<void> loadProfileImage() async{
    final prefs = await SharedPreferences.getInstance();
    String? savedUrl = prefs.getString('profileImageUrl');
    if (savedUrl != null) {
      _profileImageUrl.value = savedUrl;
      isSet.value = true;
    }
  }

  getToHomePage() => Get.to(
        ()=>const MyHomePage(title: 'Home'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );
  getToHelpPage() => Get.to(
        ()=>const HelpPage(title: 'Help'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getTofavouritePage() => Get.to(
        ()=>const favourite(title: 'Favourite'),
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