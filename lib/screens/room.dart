import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  static const String id = 'room_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Steinbergen Makadi'),
      ),
    );
  }
}
