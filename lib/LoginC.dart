
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';

class LoginC extends GetxController{
  loginMessageShow() => print('Pressed Login');
  regMessageShow() => print('Pressed Register');
  //getToRegPage() => Get.to(Reg());
  getToHomePage() => Get.to(
    const MyHomePage(title: 'Home'),
    transition: Transition.downToUp,
    duration: Durations.long1,
  );
}