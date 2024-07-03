import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';

class Hoteldetailpagec extends GetxController{
  getToHotelDetailPage(Hotel hotel) =>Get.to(() => HotelDetailsPage(hotel: hotel));
}