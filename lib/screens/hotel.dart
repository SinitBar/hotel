import 'package:flutter/material.dart';
import 'package:hotel/actors/data_provider.dart';
import 'package:hotel/constants.dart';
import 'package:hotel/screens/room.dart';
import '../components/card_item.dart';
import '../components/section_card.dart';
import '../picture_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        hotelData = hData[0];
        print(hotelData);
      });
    } catch (e) {
      print('Exception!!!!! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Отель',
            style: kTextStyleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: kBackgroundScreenColor,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionCard(
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
                  SectionCard(
                    color: Color(0x33FFC700),
                    height: 29,
                    width: 149,
                    borderRadius: 5,
                    margin: EdgeInsets.only(bottom: 4, top: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 1.0),
                          child: Text(
                            '★',
                            style: TextStyle(
                                color: Color(0xFFFFA800),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '5 Превосходно',
                          style: kTextStyleMedium.copyWith(
                            fontSize: 16,
                            color: Color(0xFFFFA800),
                          ),
                        ),
                      ],
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'от 134 673 ₽',
                        style: kTextStyleSemibold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'за тур с перелетом',
                          style: kTextStyleRegular.copyWith(
                            fontSize: 16,
                            color: kLightGrayCardTextColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SectionCard(
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
                  Wrap(
                    //runSpacing: ,
                    spacing: 8,
                    children: [
                      SectionCard(
                        //padding: EdgeInsets.zero,
                        borderRadius: 5,
                        color: kLightGrayCardColor,
                        //padding: EdgeInsets.zero,
                        child: Text(
                          '3-я линия',
                          style: kTextStyleMedium.copyWith(
                              fontSize: 16, color: kLightGrayCardTextColor),
                        ),
                      ),
                      SectionCard(
                        //padding: EdgeInsets.zero,
                        child: Text(
                          'платный WI-FI в фойе',
                          style: kTextStyleMedium.copyWith(
                              fontSize: 16, color: kLightGrayCardTextColor),
                        ),
                        borderRadius: 5,
                        color: kLightGrayCardColor,
                      ),
                      SectionCard(
                        //padding: EdgeInsets.zero,
                        child: Text(
                          '30 км до аэропорта',
                          style: kTextStyleMedium.copyWith(
                              fontSize: 16, color: kLightGrayCardTextColor),
                        ),
                        borderRadius: 5,
                        color: kLightGrayCardColor,
                      ),
                      SectionCard(
                        //padding: EdgeInsets.zero,
                        child: Text(
                          '1 км до пляжа',
                          style: kTextStyleMedium.copyWith(
                              fontSize: 16, color: kLightGrayCardTextColor),
                        ),
                        borderRadius: 5,
                        color: kLightGrayCardColor,
                      ),
                    ],
                  ),
                  Text(
                    'Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей до 18 лет!',
                    style: kTextStyleRegular,
                  ),
                  SectionCard(
                    color: kLightGrayCardColor,
                    padding: const EdgeInsets.all(15.0),
                    //height: 180,
                    child: Column(
                      children: [
                        CardItemButton(
                          assetImageIconName: 'icons/emoji-happy.256x255.png',
                          mainLabel: 'Удобства',
                          hintLabel: 'Самое необходимое',
                        ),
                        SizedBox(
                          height: 10,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 36.0),
                            child: Divider(color: kLightGrayCardTextColor),
                          ),
                        ),
                        CardItemButton(
                          assetImageIconName: 'icons/tick-square.256x255.png',
                          mainLabel: 'Что включено',
                          hintLabel: 'Самое необходимое',
                        ),
                        SizedBox(
                          height: 10,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 36.0),
                            child: Divider(color: kLightGrayCardTextColor),
                          ),
                        ),
                        CardItemButton(
                          assetImageIconName: 'icons/close-square.256x255.png',
                          mainLabel: 'Что не включено',
                          hintLabel: 'Самое необходимое',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 88,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF0D72FF)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Room.id);
                  },
                  child: Text(
                    'К выбору номера',
                    textAlign: TextAlign.center,
                    style: kTextStyleMedium.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: kImagesURLs.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = kImagesURLs
    .map(
      (item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item,
              fit: BoxFit.cover,
              //height: 257,
              //width: 343,
            ),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //       // decoration: BoxDecoration(
            //       //   gradient: LinearGradient(
            //       //     colors: [
            //       //       Color.fromARGB(200, 0, 0, 0),
            //       //       Color.fromARGB(0, 0, 0, 0)
            //       //     ],
            //       //     begin: Alignment.bottomCenter,
            //       //     end: Alignment.topCenter,
            //       //   ),
            //       // ),
            //       // padding: EdgeInsets.symmetric(
            //       //     vertical: 10.0, horizontal: 20.0),
            //       // child: Text(
            //       //   'No. ${kImagesURLs.indexOf(item)} image',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontSize: 20.0,
            //       //     fontWeight: FontWeight.bold,
            //       //   ),
            //       // ),
            //       ),
            // ),
          ],
        ),
      ),
    )
    .toList();
