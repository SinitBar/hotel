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
  final hotelDataBloc = HotelDataBloc()..add(HotelDataLoadEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignedAppBar(
        titleLabel: 'Отель',
        isHome: true,
      ),
      bottomNavigationBar: StackBottomButton(
        label: 'К выбору номера',
        navigateToId: Room.id,
      ),
      backgroundColor: kBackgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HotelDataBloc, HotelDataState>(
          bloc: hotelDataBloc,
          builder: (context, state) {
            return ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionCardWidget(
                  padding: EdgeInsets.all(15.0),
                  // width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 257,
                        width: 343,
                        child: PictureCarousel(
                          imagesURLs: state.hotelData.image_urls ?? [],
                          // (state is HotelDataLoadedState)
                          //     ? (state.hotelData.image_urls ?? [])
                          //     : [],
                        ),
                      ),
                      SectionCardWidget(
                        color: Color(0x33FFC700),
                        height: 29,
                        width: 149,
                        borderRadius: 5,
                        margin: EdgeInsets.only(bottom: 4, top: 15),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: RatingWidget(
                          rating: state.hotelData.rating,
                          // (state is HotelDataLoadedState)
                          //     ? (state.hotelData.rating ?? 0)
                          //     : 0,
                          ratingName: state.hotelData.rating_name,
                          // : (state is HotelDataLoadedState)
                          //     ? (state.hotelData.rating_name ?? '')
                          //     : 'Загрузка...',
                        ),
                      ),
                      Text(
                        state.hotelData.name,
                        // (state is HotelDataLoadedState)
                        //     ? (state.hotelData.name ?? '')
                        //     : '',
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
                              // (state is HotelDataLoadedState)
                              //     ? (state.hotelData.adress ?? '')
                              //     : '',
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
                        // (state is HotelDataLoadedState)
                        //     ? (state.hotelData.minimal_price ?? 0)
                        //     : 0,
                        priceForIt: state.hotelData.price_for_it,
                        // (state is HotelDataLoadedState)
                        //     ? (state.hotelData.price_for_it ?? '')
                        //     : '',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SectionCardWidget(
                  padding: EdgeInsets.all(16),
                  height: 435,
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
                        // (state is HotelDataLoadedState)
                        //     ? (state.hotelData.about_the_hotel.peculiarities ??
                        //         [])
                        //     : [],
                        // [
                        //   '3-я линия',
                        //   'платный WI-FI в фойе',
                        //   '30 км до аэропорта',
                        //   '1 км до пляжа',
                        // ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          state.hotelData.about_the_hotel.description,
                          // (state is HotelDataLoadedState)
                          //     ? (state.hotelData.about_the_hotel.description ??
                          //         '')
                          //     : '',
                          //'Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей до 18 лет!',
                          style: kTextStyleRegular,
                        ),
                      ),
                      const SectionCardWidget(
                        color: kLightGrayCardColor,
                        padding: EdgeInsets.all(15.0),
                        //height: 180,
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

class DesignedAppBar extends AppBar {
  DesignedAppBar({
    required this.titleLabel,
    this.isHome = false,
    super.key,
  });

  final String titleLabel;
  final bool isHome;

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        titleLabel,
        style: kTextStyleMedium,
      ),
      leading: isHome
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
    );
  }
}
