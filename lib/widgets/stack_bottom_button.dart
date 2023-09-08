import 'package:flutter/material.dart';
import 'package:hotel/blocs/hotel_data/hotel_data_bloc.dart';
import '../constants.dart';

class StackBottomButton extends StatelessWidget {
  const StackBottomButton({
    super.key,
    this.hotelDataBloc,
    required this.label,
    required this.navigateToId,
    this.clearStack = false,
  });

  final HotelDataBloc? hotelDataBloc;
  final String label;
  final String navigateToId;
  final bool clearStack;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => const Size.fromWidth(2000),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => kBlueIconColor),
      ),
      onPressed: () {
        if (clearStack) {
          Navigator.pushNamedAndRemoveUntil(
              context, navigateToId, (route) => false);
        } else {
          Navigator.pushNamed(
            context,
            navigateToId,
            arguments: hotelDataBloc,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: kTextStyleMedium.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
