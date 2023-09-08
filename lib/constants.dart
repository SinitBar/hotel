import 'package:flutter/material.dart';

const kBackgroundScreenColor = Color(0xFFF6F6F9);
const kLightGrayColor = Color(0xFFFBFBFC);
const kLightGrayTextColor = Color(0xFF828796);
const kVeryLightGrayTextColor = Color(0xFFA9ABB7);
const kErrorTextFieldFillColor =
    Color(0x26EB5757); // such a strange color but it is 15% opacity
const kLightBlueBackgroundColor = Color(0x1A0D72FF);
const kBlueIconColor = Color(0xFF0D72FF);

const kTextStyleMedium = TextStyle(
  fontFamily: 'SF-Pro-Display',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);

const kTextStyleSemibold = TextStyle(
  fontFamily: 'SF-Pro-Display',
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
);

const kTextStyleRegular = TextStyle(
  fontFamily: 'SF-Pro-Display',
  fontSize: 16.0,
);

final kIconButtonStyle = IconButton.styleFrom(
  backgroundColor: kLightBlueBackgroundColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
);
