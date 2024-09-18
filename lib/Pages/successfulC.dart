import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/MyHomePage.dart';

class SuccessfulPageC extends GetxController{

  getToHomePage() => Get.to(
        ()=>const MyHomePage(title: 'Home'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

}