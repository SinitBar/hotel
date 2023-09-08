import 'package:flutter/material.dart';
import '../constants.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  final int rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 1.0),
          child: Text(
            '★',
            style: TextStyle(
                color: Color(0xFFFFA800), fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          '$rating $ratingName',
          style: kTextStyleMedium.copyWith(
            fontSize: 16,
            color: const Color(0xFFFFA800),
          ),
        ),
      ],
    );
  }
}
