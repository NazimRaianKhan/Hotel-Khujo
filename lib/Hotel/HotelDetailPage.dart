import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPageC.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';

class HotelDetailsPage extends StatelessWidget {
  final Hotel hotel;
  final Hoteldetailpagec a=Get.put(Hoteldetailpagec());

  HotelDetailsPage({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(hotel.imageUrl),
          SizedBox(height: 20),
          Text(' ${hotel.name} '),
          Text(' ${hotel.price} '),
          Text(' ${hotel.location} '),
          Text(' ${hotel.descrip} '),
          // Add more details or actions as needed
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () async{
                a.getToBookingPage();
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity,50),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: const Text('BOOK THIS NOW'),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(hotel.name),
        actions: const [

                    Icon(
                      Icons.favorite,
                      color: Colors.orangeAccent,
                    ),
        ],
      ),
    );
  }
}