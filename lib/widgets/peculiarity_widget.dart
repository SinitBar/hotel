import 'package:flutter/material.dart';
import 'package:hotel/widgets/section_card_widget.dart';
import '../constants.dart';

class PeculiarityWidget extends StatelessWidget {
  const PeculiarityWidget({
    super.key,
    required this.peculiarity,
  });

  final String peculiarity;

  @override
  Widget build(BuildContext context) {
    return SectionCardWidget(
      borderRadius: 5,
      color: kLightGrayColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          peculiarity,
          style: kTextStyleMedium.copyWith(
              fontSize: 16, color: kLightGrayTextColor),
        ),
      ),
    );
  }
}
