import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Pages/profile.dart';

import 'Pages/help.dart';

class MyHomePageC extends GetxController{

  getToProfilePage() => Get.to(
        ()=>const ProfilePage(title: 'Profile'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

  getToHelpPage() => Get.to(
        ()=>const HelpPage(title: 'help'),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );

}