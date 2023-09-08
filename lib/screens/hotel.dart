import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/constants.dart';
import 'package:hotel/screens/room.dart';
import '../blocs/hotel_data/hotel_data_bloc.dart';
import '../widgets/card_item_button.dart';
import '../widgets/divider_box_widget.dart';
import '../widgets/peculiarities_wrap_widget.dart';
import '../widgets/pricing_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/section_card_widget.dart';
import '../widgets/picture_carousel.dart';
import '../widgets/stack_bottom_button.dart';

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  static const String id = 'hotel_screen';

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Отель',
          style: kTextStyleMedium,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15.0),
        child: const StackBottomButton(
          label: 'К выбору номера',
          navigateToId: Room.id,
        ),
      ),
      backgroundColor: kBackgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HotelDataBloc, HotelDataState>(
          builder: (context, state) {
            return ListView(
              children: [
                SectionCardWidget(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 257,
                        child: (state is HotelDataLoadedState)
                            ? PictureCarousel(
                                imagesURLs: state.hotelData.image_urls ?? [],
                              )
                            : const SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: SectionCardWidget(
                                    height: 200,
                                    width: 200,
                                    child: CircularProgressIndicator(
                                      color: kBlueIconColor,
                                      backgroundColor: kBackgroundScreenColor,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SectionCardWidget(
                        color: const Color(0x33FFC700),
                        height: 29,
                        width: 149,
                        borderRadius: 5,
                        margin: const EdgeInsets.only(bottom: 4, top: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: RatingWidget(
                          rating: state.hotelData.rating,
                          ratingName: state.hotelData.rating_name,
                        ),
                      ),
                      Text(
                        state.hotelData.name,
                        style: kTextStyleMedium.copyWith(fontSize: 22),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 17,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                (states) => EdgeInsets.zero,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            child: Text(
                              state.hotelData.adress,
                              style: kTextStyleMedium.copyWith(
                                fontSize: 14,
                                color: const Color(0xFF0D72FF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PricingWidget(
                        minimalPrice: state.hotelData.minimal_price,
                        priceForIt: state.hotelData.price_for_it,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SectionCardWidget(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Об отеле',
                          style: kTextStyleMedium.copyWith(fontSize: 22),
                        ),
                      ),
                      PeculiaritiesWrapWidget(
                        peculiarities:
                            state.hotelData.about_the_hotel.peculiarities ?? [],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          state.hotelData.about_the_hotel.description,
                          style: kTextStyleRegular,
                        ),
                      ),
                      const SectionCardWidget(
                        color: kLightGrayColor,
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            CardItemButton(
                              assetImageIconName:
                                  'icons/emoji-happy.256x255.png',
                              mainLabel: 'Удобства',
                              hintLabel: 'Самое необходимое',
                            ),
                            DividerBoxWidget(),
                            CardItemButton(
                              assetImageIconName:
                                  'icons/tick-square.256x255.png',
                              mainLabel: 'Что включено',
                              hintLabel: 'Самое необходимое',
                            ),
                            DividerBoxWidget(),
                            CardItemButton(
                              assetImageIconName:
                                  'icons/close-square.256x255.png',
                              mainLabel: 'Что не включено',
                              hintLabel: 'Самое необходимое',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
