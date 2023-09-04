import 'package:flutter/material.dart';

import '../constants.dart';

class CardItemButton extends StatelessWidget {
  const CardItemButton({
    super.key,
    required this.assetImageIconName,
    required this.mainLabel,
    required this.hintLabel,
  });

  final String assetImageIconName;
  final String mainLabel;
  final String hintLabel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ImageIcon(
                  AssetImage(assetImageIconName),
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainLabel,
                      style: kTextStyleMedium.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      hintLabel,
                      style: kTextStyleMedium.copyWith(
                        fontSize: 14,
                        color: kLightGrayTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Color(0xFF2C3035),
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
