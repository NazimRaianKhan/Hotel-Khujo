import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hotel_khujo/Pages/bookingPageC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Hotel/HotelDetailPageC.dart';
import 'package:hotel_khujo/Hotel/hotel.dart';
import 'package:hotel_khujo/MyHomePageC.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();


  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _numberOfPeople = 1;
  //

  late DatabaseReference dbRef;

  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Orders');
  }

  @override
  Widget build(BuildContext context) {
    final bookingPageC a=Get.put(bookingPageC());
    String? naame = a.displayName();
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Room'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20.0),
            Text('Number of People:'),
            Slider(
              value: _numberOfPeople.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: _numberOfPeople.toString(),
              onChanged: (double value) {
                setState(() {
                  _numberOfPeople = value.round();
                });
              },
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Map<String, String?> orders = {
                      'name': naame,
                      'hotel': "add hotelname here",
                      'date': _selectedDay!.toIso8601String(),
                      'numberOfPeople': _numberOfPeople.toString()
                    };
                  if (_selectedDay != null) {
                    // Send booking details to Firebase
                    _database.child('bookings').push().set(orders).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking Successful!')),
                      );
                      a.getToSuccessfulPage();
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to book: $error')),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a date!')),
                    );
                  }
                },
                child: Text('Book Room'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
