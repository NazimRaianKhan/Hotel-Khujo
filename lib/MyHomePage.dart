/*
 * @author: ARDhruvo
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPageC.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePageC.dart';

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
              icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
            color: const Color.fromRGBO(255,183,77, 1),
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Image.asset('assets/logo1.png'),)),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Profile"),
                  onTap: () {
                    a.getToProfilePage();
                  }, //Profile Page
                ),
                ListTile(
                  leading: Icon(Icons.assignment_turned_in),
                  title: Text("Booked"),
                  onTap: () {}, //Booked Page
                ),
                ListTile(
                  leading: Icon(Icons.favorite_outlined),
                  title: Text("Favorites"),
                  onTap: () {}, //Favorite Page
                ),
                ListTile(
                  leading: Icon(Icons.announcement),
                  title: Text("Helps and Services"),
                  onTap: () {
                    a.getToHelpPage();
                  }, //Help Page
                ),
                ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("Sign Out"),
                  onTap: () {
                    a.getToLoginPage();
                  }, // Sign Out
                ),
              ],
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Stay Tuned for the Dashboard on the Home Page!',
            ),
            const Text(
              'Until then press button to make number go beeg',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
          return Center(child: CircularProgressIndicator());
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
          return Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError){
          return Center(child: Text('Error : ${snapshot.error}'));
        }

        if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
          return Center(child: Text('No hotels found.'));
        }

        List <Hotel> hotels = snapshot.data!.docs.map((doc){
          return Hotel(
            id: doc.id,
            name: doc['name'],
            imageUrl: doc['imageUrl'],
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