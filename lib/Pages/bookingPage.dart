import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hotel_khujo/Pages/bookingPageC.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hotel Booking App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BookingPage(),
//     );
//   }
// }

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  final bookingPageC a=Get.put(bookingPageC());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _numberOfPeople = 1;

  @override
  Widget build(BuildContext context) {
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
                  a.getToSuccessfulPage();
                  if (_selectedDay != null) {
                    // Send booking details to Firebase
                    _database.child('bookings').push().set({
                      'date': _selectedDay!.toIso8601String(),
                      'numberOfPeople': _numberOfPeople,
                      // Add more fields as needed
                    }).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking Successful!')),
                      );
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
