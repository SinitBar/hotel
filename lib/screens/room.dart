import 'package:flutter/material.dart';

import '../constants.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  static const String id = 'room_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundScreenColor,
      appBar: AppBar(
        title: Text('Steinbergen Makadi'),
      ),
    );
  }
}
