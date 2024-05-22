
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';
import 'package:hotel_khujo/reg.dart';

class LoginC extends GetxController{
  loginMessageShow() => print('Pressed Login');
  regMessageShow() => print('Pressed Register');
  getToRegPage() => Get.to(
      const Register(title: 'Regi'),
      transition: Transition.downToUp,
      duration: Durations.long1,
  );
  getToHomePage() => Get.to(
    const MyHomePage(title: 'Home'),
    transition: Transition.downToUp,
    duration: Durations.long1,
  );
}