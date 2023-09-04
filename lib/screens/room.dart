import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/screens/booking.dart';
import 'package:hotel/widgets/section_card_widget.dart';
import 'package:hotel/widgets/stack_bottom_button.dart';
import '../blocs/hotel_data/hotel_data_bloc.dart';
import '../blocs/rooms_data/rooms_data_bloc.dart';
import '../constants.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  static const String id = 'room_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomsDataBloc()..add(RoomsDataLoadEvent()),
      child: Scaffold(
        backgroundColor: kBackgroundScreenColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlocBuilder<HotelDataBloc, HotelDataState>(
            builder: (context, state) {
              return Text(
                state.hotelData.name,
                style: kTextStyleMedium,
              );
            },
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SafeArea(
          child: BlocBuilder<RoomsDataBloc, RoomsDataState>(
            builder: (context, state) {
              return ListView(
                  children:
                      List.generate(state.roomsData.rooms.length, (index) {
                final room = state.roomsData.rooms[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionCardWidget(
                      child: Column(
                        children: [
                          Text(room.name),
                          StackBottomButton(
                              label: 'Выбрать номер', navigateToId: Booking.id)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                );
              })
                  //SectionCardWidget(child: state.roomsData.rooms),
                  );
            },
          ),
        ),
      ),
    );
  }
}
