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
                  children: List.generate(
                state.roomsData.rooms.length,
                (index) {
                  final room = state.roomsData.rooms[index];
                  return Column(
                    children: [
                      SectionCardWidget(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 257,
                              child: (state is RoomsDataLoadedState)
                                  ? PictureCarousel(
                                      imagesURLs: room.image_urls ?? [],
                                    )
                                  : const SizedBox(
                                      width: double.infinity,
                                      child: Center(
                                        child: SectionCardWidget(
                                          height: 200,
                                          width: 200,
                                          child: CircularProgressIndicator(
                                            color: kBlueIconColor,
                                            backgroundColor:
                                                kBackgroundScreenColor,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Text(
                              room.name,
                              style: kTextStyleMedium.copyWith(fontSize: 22),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: PeculiaritiesWrapWidget(
                                peculiarities: room.peculiarities ?? [],
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (states) =>
                                        const EdgeInsets.only(left: 8.0)),
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => kLightBlueBackgroundColor),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Подробнее о номере',
                                    textAlign: TextAlign.start,
                                    style: kTextStyleMedium.copyWith(
                                      color: const Color(0xFF0D72FF),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.navigate_next_outlined,
                                    color: kBlueIconColor,
                                  ),
                                ],
                              ),
                            ),
                            PricingWidget(
                              minimalPrice: room.price,
                              priceForIt: room.price_per,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: StackBottomButton(
                                label: 'Выбрать номер',
                                navigateToId: Booking.id,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                },
              ));
            },
          ),
        ),
      ),
    );
  }
}
