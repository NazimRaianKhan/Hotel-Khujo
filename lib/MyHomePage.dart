/*
 * @author: ARDhruvo
 * Update 1: Search Bar
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Color.fromRGBO(239, 108, 0, 1), actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ]),
      drawer: Drawer(
        child: Container(
            color: const Color.fromRGBO(255, 183, 77, 1),
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Text("Insert Icon here"))),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Profile"),
                  onTap: () {}, //Profile Page
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
                  onTap: () {}, //Help Page
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> hotels = [
    'Pan Pacific',
    'Intercontinental',
    'Westin',
    'Radison',
    'Sea Pearl'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  List<Widget> buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var hot in hotels) {
      if (hot.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hot);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  List<Widget> buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var hot in hotels) {
      if (hot.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hot);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
