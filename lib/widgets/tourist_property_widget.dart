import 'package:flutter/material.dart';
import '../constants.dart';

class TouristPropertyWidget extends StatefulWidget {
  const TouristPropertyWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.label,
  });

  final TextEditingController controller;
  final String label;
  final void Function(String) onChanged;

  @override
  State<TouristPropertyWidget> createState() => _TouristPropertyWidgetState();
}

class _TouristPropertyWidgetState extends State<TouristPropertyWidget> {
  late Color backgroundColor;

  @override
  void initState() {
    backgroundColor = kBackgroundScreenColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: TextField(
        cursorColor: Colors.grey,
        controller: widget.controller,
        onChanged: (value) {
          setState(() {
            backgroundColor = value.isEmpty
                ? kErrorTextFieldFillColor
                : kBackgroundScreenColor;
          });
          widget.onChanged(value);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border: InputBorder.none,
          labelText: widget.label,
          labelStyle: kTextStyleMedium.copyWith(
            color: kVeryLightGrayTextColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
