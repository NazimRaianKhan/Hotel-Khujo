import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPageC.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePageC.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hotel_khujo/Pages/profileC.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<DocumentSnapshot>> getimgfromFirebase() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("slides").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    final MyHomePageC a = Get.put(MyHomePageC());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: getimgfromFirebase(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images found.'));
          }
          return CarouselSlider.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index, realIdx) {
              DocumentSnapshot sliderImage = snapshot.data![index];
              return Container(
                child: Image.network(sliderImage['img']),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),
          );
        },
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(255, 183, 77, 1),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset('assets/logo1.png'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text("Profile"),
                onTap: () {
                  a.getToProfilePage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_turned_in),
                title: const Text("Booked"),
                onTap: () {
                  a.getToBookingPage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_outlined),
                title: const Text("Favorites"),
                onTap: () {
                  a.getTofavouritePage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text("Helps and Services"),
                onTap: () {
                  a.getToHelpPage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.directions_run),
                title: const Text("Sign Out"),
                onTap: () {
                  a.getToLoginPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Hoteldetailpagec a = Get.put(Hoteldetailpagec());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _getSuggestions(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<String>? suggestions = snapshot.data;

        return ListView.builder(
          itemCount: suggestions?.length ?? 0,
          itemBuilder: (context, index) {
            String suggestion = suggestions![index];
            return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  Future<List<String>> _getSuggestions(String query) async {
    if (query.isEmpty) {
      return [];
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('hotels')
        .orderBy('name')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThan: query + 'z')
        .limit(5)
        .get();

    return querySnapshot.docs.map((doc) => doc['name'] as String).toList();
  }

  Widget _buildSearchResults(String query) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('hotels')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: query + 'z')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No hotels found.'));
        }

        List<Hotel> hotels = snapshot.data!.docs.map((doc) {
          return Hotel(
            id: doc.id,
            name: doc['name'],
            imageUrl: doc['imageUrl'],
            descrip: doc['descrip'],
            location: doc['location'],
          );
        }).toList();

        return ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            Hotel hotel = hotels[index];
            return ListTile(
              title: Text(hotel.name),
              leading: Image.network(hotel.imageUrl),
              onTap: () {
                a.getToHotelDetailPage(hotel);
              },
            );
          },
        );
      },
    );
  }
}
