import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPage.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/Pages/favouriteC.dart';

class favourite extends StatefulWidget {
  final String title;

  const favourite({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  final favouriteC favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Obx(() {
        if (Get.find<favouriteC>().favorites.isEmpty) {
          return const Center(child: Text("No favorite hotels found."));
        }

        return ListView.builder(
          itemCount: favoritesController.favorites.length,
          itemBuilder: (context, index) {
            Hotel hotel = favoritesController.favorites[index];
            return ListTile(
              title: Text(hotel.name),
              leading: Image.network(hotel.imageUrl),
              onTap: () {
                // Navigate to the hotel details page
                Get.to(HotelDetailsPage(hotel: hotel));
              },
            );
          },
        );
      }),
    );
  }
}