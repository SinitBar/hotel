import 'package:flutter/material.dart';

import '../constants.dart';

class PricingWidget extends StatelessWidget {
  const PricingWidget({
    super.key,
    required this.minimalPrice,
    required this.priceForIt,
  });

  final int minimalPrice;
  final String priceForIt;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          'от $minimalPrice ₽',
          style: kTextStyleSemibold,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            priceForIt,
            style: kTextStyleRegular.copyWith(
              fontSize: 16,
              color: kLightGrayCardTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
