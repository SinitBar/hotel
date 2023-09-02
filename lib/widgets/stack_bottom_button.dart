import 'package:flutter/material.dart';
import '../constants.dart';

class StackBottomButton extends StatelessWidget {
  const StackBottomButton({
    super.key,
    required this.label,
    required this.navigateToId,
  });

  final String label;
  final String navigateToId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF0D72FF)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, navigateToId);
          },
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: kTextStyleMedium.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
