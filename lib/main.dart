import 'package:flutter/material.dart';
import 'package:hotel/screens/booking.dart';
import 'package:hotel/screens/hotel.dart';
import 'package:hotel/screens/paid.dart';
import 'package:hotel/screens/room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Hotel.id,
      routes: {
        Hotel.id: (context) => const Hotel(),
        Room.id: (context) => const Room(),
        Booking.id: (context) => const Booking(),
        Paid.id: (context) => const Paid(),
      },
    );
  }
}
