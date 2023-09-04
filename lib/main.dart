import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/screens/booking.dart';
import 'package:hotel/screens/hotel.dart';
import 'package:hotel/screens/paid.dart';
import 'package:hotel/screens/room.dart';

import 'blocs/hotel_data/hotel_data_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final _hotelDataBloc = BlocProvider.of<HotelDataBloc>(context)..add(HotelDataLoadEvent());
    return BlocProvider(
      lazy: false,
      create: (context) => HotelDataBloc()..add(HotelDataLoadEvent()),
      //BlocProvider.of<HotelDataBloc>(context)..add(HotelDataLoadEvent()),
      child: MaterialApp(
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
      ),
    );
  }
}
