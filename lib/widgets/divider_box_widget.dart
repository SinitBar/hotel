import 'package:flutter/material.dart';

import '../constants.dart';

class DividerBoxWidget extends StatelessWidget {
  const DividerBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
      child: Padding(
        padding: EdgeInsets.only(left: 36.0),
        child: Divider(color: kLightGrayCardTextColor),
      ),
    );
  }
}
