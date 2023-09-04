import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/screens/booking.dart';
import 'package:hotel/widgets/pricing_widget.dart';
import 'package:hotel/widgets/section_card_widget.dart';
import 'package:hotel/widgets/stack_bottom_button.dart';
import '../blocs/hotel_data/hotel_data_bloc.dart';
import '../blocs/rooms_data/rooms_data_bloc.dart';
import '../constants.dart';
import '../widgets/peculiarities_wrap_widget.dart';
import '../widgets/picture_carousel.dart';

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
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionCardWidget(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 257,
                            child: PictureCarousel(
                              imagesURLs: room.image_urls ?? [],
                            ),
                          ),
                          Text(
                            room.name,
                            style: kTextStyleMedium.copyWith(fontSize: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: PeculiaritiesWrapWidget(
                              peculiarities: room.peculiarities ?? [],
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.resolveWith(
                                  (states) => const Size.fromWidth(205)),
                              // maximumSize: MaterialStateProperty.resolveWith(
                              //     (states) => const Size.fromWidth(192)),
                              shape: MaterialStateProperty.resolveWith(
                                (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0x1A0D72FF)),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Подробнее о номере',
                                  textAlign: TextAlign.center,
                                  style: kTextStyleMedium.copyWith(
                                    color: const Color(0xFF0D72FF),
                                    fontSize: 16,
                                  ),
                                ),
                                const Icon(
                                  Icons.navigate_next_outlined,
                                  color: Color(0xFF0D72FF),
                                ),
                              ],
                            ),
                          ),
                          PricingWidget(
                            minimalPrice: room.price,
                            priceForIt: room.price_per,
                          ),
                          StackBottomButton(
                            label: 'Выбрать номер',
                            navigateToId: Booking.id,
                          ),
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
