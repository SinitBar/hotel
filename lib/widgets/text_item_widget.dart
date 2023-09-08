import 'package:flutter/material.dart';

import '../constants.dart';

class TextIemWidget extends StatelessWidget {
  const TextIemWidget({
    super.key,
    required this.label,
    required this.value,
    this.textAlign,
  });

  final String label;
  final String value;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: kTextStyleRegular.copyWith(color: kLightGrayTextColor),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: kTextStyleRegular,
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }
}
