import 'package:flutter/material.dart';
import 'package:hotel/actors/data_provider.dart';
import 'package:hotel/constants.dart';
import 'package:hotel/screens/room.dart';
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
  late final HotelData hotelData;
  late final DataProvider dataProvider;

  @override
  void initState() {
    super.initState();
    dataProvider = DataProvider();
    getHotelData();
  }

  Future<void> getHotelData() async {
    try {
      var hData = await dataProvider.getHotelData();
      setState(() {
        hotelData = hData;
        print(hotelData.about_the_hotel?.description);
      });
    } catch (e) {
      print('Exception!!!!! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignedAppBar('Отель'),
      backgroundColor: kBackgroundScreenColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
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
                      //     PictureCarousel(
                      //       imagesURLs: kImagesURLs,
                      //     ),
                      //CarouselWithIndicatorDemo(),
                      SizedBox(
                        height: 257,
                        width: 343,
                        child: PictureCarousel(imagesURLs: kImagesURLs),
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
                          rating: 5,
                          ratingName: 'Превосходно',
                        ),
                      ),
                      Text(
                        'Steigenbergen Makadi',
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
                              'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                              style: kTextStyleMedium.copyWith(
                                fontSize: 14,
                                color: const Color(0xFF0D72FF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PricingWidget(
                        minimalPrice: '134 673',
                        priceForIt: 'за тур с перелетом',
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
                        peculiarities: [
                          '3-я линия',
                          'платный WI-FI в фойе',
                          '30 км до аэропорта',
                          '1 км до пляжа',
                        ],
                      ),
                      Text(
                        'Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей до 18 лет!',
                        style: kTextStyleRegular,
                      ),
                      SectionCardWidget(
                        color: kLightGrayCardColor,
                        padding: const EdgeInsets.all(15.0),
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
                SizedBox(height: 88),
              ],
            ),
            StackBottomButton(
              label: 'К выбору номера',
              navigateToId: Room.id,
            ),
          ],
        ),
      ),
    );
  }
}

class DesignedAppBar extends AppBar {
  DesignedAppBar(
    this.titleLabel, {
    super.key,
  });

  final String titleLabel;

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          titleLabel,
          style: kTextStyleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
