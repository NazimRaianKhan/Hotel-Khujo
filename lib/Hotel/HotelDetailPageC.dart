import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/Pages/successful.dart';

class Hoteldetailpagec extends GetxController{
  getToHotelDetailPage(Hotel hotel) =>Get.to(() => HotelDetailsPage(hotel: hotel));
  getToSuccessfulPage() => Get.to(
        ()=> successfullPage(),
    transition: Transition.rightToLeft,
    duration: Durations.long1,
  );
}