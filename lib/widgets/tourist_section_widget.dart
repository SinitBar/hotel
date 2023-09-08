import 'package:flutter/material.dart';
import 'package:hotel/widgets/section_card_widget.dart';
import 'package:hotel/widgets/visibility_switch_pair_widget.dart';
import '../blocs/tourists_info/tourist.dart';
import '../blocs/tourists_info/tourists_info_bloc.dart';
import '../constants.dart';

class TouristsSectionWidget extends StatelessWidget {
  const TouristsSectionWidget({
    super.key,
    required this.touristsInfoBloc,
  });

  final TouristsInfoBloc touristsInfoBloc;

  List<VisibilitySwitchPairWidget> generateWidgetsList() {
    List<VisibilitySwitchPairWidget> tourists =
    List.generate(touristsInfoBloc.state.touristList.length, (index) {
      return VisibilitySwitchPairWidget(
        bloc: touristsInfoBloc,
        label: Tourist.convertIndexToWord(index),
        index: index,
      );
    });
    return tourists;
  }

  @override
  Widget build(BuildContext context) {
    final tourists = generateWidgetsList();
    return Column(
      children: [
        Column(
          children: tourists,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            SectionCardWidget(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Добавить туриста',
                    style: kTextStyleMedium.copyWith(fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () {
                      final touristList = touristsInfoBloc.state.touristList;
                      touristsInfoBloc.add(TouristsInfoAddTouristEvent(
                          touristList: touristList));
                    },
                    icon: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                    ),
                    style: kIconButtonStyle.copyWith(
                        backgroundColor:
                        const MaterialStatePropertyAll(kBlueIconColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}