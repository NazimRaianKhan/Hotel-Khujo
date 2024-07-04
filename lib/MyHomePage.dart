/*
 * @author: ARDhruvo
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPageC.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePageC.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<String> _carouselImages = [];
  final _firestoreInstance = FirebaseFirestore.instance;
  var _dotPosition = 0;


  fetchCarouselImages() async {
    QuerySnapshot qn =
    await _firestoreInstance.collection("slides").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["slide-img"],
        );
        print(qn.docs[i]["slide-img"]);
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final MyHomePageC a=Get.put(MyHomePageC());

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
                    delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                    items: _carouselImages
                        .map((item) => Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fitWidth)),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carouselPageChangedReason) {
                          setState(() {
                            _dotPosition = val;
                          });
                        })),
              ),
              const SizedBox(
                height: 5,
              ),

              DotsIndicator(
                dotsCount:
                _carouselImages.isEmpty ? 1 : _carouselImages.length,
                position: _dotPosition.toDouble(),
                decorator: const DotsDecorator(
                  activeColor: Colors.deepOrange,
                  color: Colors.deepOrange,
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8, 8),
                  size: Size(6, 6),
                ),
              ),
            ]
        ),
      ),
      drawer: Drawer(
        child: Container(
            color: const Color.fromRGBO(255,183,77, 1),
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Image.asset('assets/logo1.png'),)),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Profile"),
                  onTap: () {
                    a.getToProfilePage();
                  }, //Profile Page
                ),
                ListTile(
                  leading: const Icon(Icons.assignment_turned_in),
                  title: const Text("Booked"),
                  onTap: () {}, //Booked Page
                ),
                ListTile(
                  leading: const Icon(Icons.favorite_outlined),
                  title: const Text("Favorites"),
                  onTap: () {}, //Favorite Page
                ),
                ListTile(
                  leading: const Icon(Icons.announcement),
                  title: const Text("Helps and Services"),
                  onTap: () {
                    a.getToHelpPage();
                  }, //Help Page
                ),
                ListTile(
                  leading: const Icon(Icons.directions_run),
                  title: const Text("Sign Out"),
                  onTap: () {
                    a.getToLoginPage();
                  }, // Sign Out
                ),
              ],
            )),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate<String> {

  final Hoteldetailpagec a=Get.put(Hoteldetailpagec());

  @override
  List<IconButton> buildActions(BuildContext context) {
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
    return IconButton(icon: const Icon(Icons.arrow_back),
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

  Widget _buildSearchResults(String query){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('hotels').where('name',isGreaterThanOrEqualTo: query).where('name' ,isLessThan: query + 'z').snapshots(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError){
          return Center(child: Text('Error : ${snapshot.error}'));
        }

        if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
          return const Center(child: Text('No hotels found.'));
        }

        List <Hotel> hotels = snapshot.data!.docs.map((doc){
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
            itemBuilder: (context,index){
              Hotel hotel =hotels[index];
              return ListTile(
                title: Text(hotel.name),
                leading: Image.network(hotel.imageUrl),
                onTap: (){
                  a.getToHotelDetailPage(hotel);
                },
              );
            },
        );

      },
    );
  }

}