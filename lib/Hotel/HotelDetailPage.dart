import 'package:flutter/material.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';

class HotelDetailsPage extends StatelessWidget {
  final Hotel hotel;

  HotelDetailsPage({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(hotel.imageUrl),
          SizedBox(height: 20),
          Text('Details about ${hotel.name} can be shown here.'),
          // Add more details or actions as needed
        ],
      ),
    );
  }
}