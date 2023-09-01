import 'package:flutter/material.dart';
import 'package:hotel/widgets/peculiarity_widget.dart';

class PeculiaritiesWrapWidget extends StatelessWidget {
  const PeculiaritiesWrapWidget({
    super.key,
    required this.peculiarities,
  });
  final List<String> peculiarities;

  List<PeculiarityWidget> _wrapWithPeculiarity() => List.generate(
      peculiarities.length,
      (index) => PeculiarityWidget(peculiarity: peculiarities[index]));

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: _wrapWithPeculiarity(),
    );
  }
}
