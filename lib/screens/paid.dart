import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/stack_bottom_button.dart';
import 'hotel.dart';
import 'dart:math';

class Paid extends StatelessWidget {
  const Paid({super.key});

  static const String id = 'paid_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Заказ оплачен',
          style: kTextStyleMedium,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Hotel.id, (route) => false);
            }),
      ),
      bottomNavigationBar: StackBottomButton(
        label: 'Супер!',
        navigateToId: Hotel.id,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFF6F6F9),
                  radius: 47,
                  // foregroundImage: Image.asset(
                  //   'icons/party_popper.png',
                  //   //width: 20,
                  //   //height: 20,
                  //   scale: 0.5,
                  //   fit: BoxFit.cover,
                  // ).image,
                ),
                Positioned(
                  child: Image.asset(
                    'icons/party_popper.png',
                    width: 44,
                    height: 44,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Ваш заказ принят в работу',
                style: kTextStyleMedium.copyWith(fontSize: 22),
              ),
            ),
            Text(
              'Подтверждение заказа №${Random().nextInt(900000) + 100000} может занять некоторое время (от 1 часа до суток).\nКак только мы получим ответ от туроператора, вам на почту придет уведомление.',
              textAlign: TextAlign.center,
              style: kTextStyleRegular.copyWith(color: kLightGrayTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
