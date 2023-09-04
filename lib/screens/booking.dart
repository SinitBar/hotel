import 'package:flutter/material.dart';
import 'package:hotel/screens/paid.dart';

import '../constants.dart';
import '../widgets/stack_bottom_button.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  static const String id = 'booking_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Бронирование',
          style: kTextStyleMedium,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: StackBottomButton(
        label: 'Оплатить БАБЛО ₽',
        navigateToId: Paid.id,
      ),
    );
  }
}
