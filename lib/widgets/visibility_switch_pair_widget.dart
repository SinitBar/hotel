import 'package:flutter/material.dart';
import 'package:hotel/widgets/section_card_widget.dart';
import 'package:hotel/widgets/tourist_property_widget.dart';
import '../blocs/tourists_info/tourists_info_bloc.dart';
import '../constants.dart';

class VisibilitySwitchPairWidget extends StatefulWidget {
  const VisibilitySwitchPairWidget({
    super.key,
    required this.label,
    required this.bloc,
    required this.index,
    required this.triedToPay,
  });

  final String label;
  final TouristsInfoBloc bloc;
  final int index;
  final bool triedToPay;

  @override
  State<VisibilitySwitchPairWidget> createState() =>
      _VisibilitySwitchPairWidgetState();
}

class _VisibilitySwitchPairWidgetState
    extends State<VisibilitySwitchPairWidget> {
  late Widget widgetToShow;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _foreignPassportNumberController =
      TextEditingController();
  final TextEditingController _expiryDateOfThePassportController =
      TextEditingController();

  @override
  void initState() {
    chosenWithWrapped(isWrapped: widget.index != 0);
    final tourist = widget.bloc.state.touristList[widget.index];
    _nameController.addListener(() {
      if (tourist.name.isNotEmpty && _nameController.text.isEmpty) {
        _nameController.value = _nameController.value.copyWith(
          text: tourist.name,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _dateOfBirthController.dispose();
    _nationalityController.dispose();
    _foreignPassportNumberController.dispose();
    _expiryDateOfThePassportController.dispose();
    super.dispose();
  }

  void chosenWithWrapped({required bool isWrapped}) {
    setState(() {
      if (isWrapped) {
        widgetToShow = SectionCardWidget(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: kTextStyleMedium.copyWith(fontSize: 22),
              ),
              IconButton(
                onPressed: () {
                  chosenWithWrapped(isWrapped: false);
                },
                icon: const Icon(
                  Icons.expand_more_rounded,
                  color: kBlueIconColor,
                ),
                style: kIconButtonStyle,
              ),
            ],
          ),
        );
      } else {
        final tourist = widget.bloc.state.touristList[widget.index];
        _surnameController.value = _surnameController.value.copyWith(
          text: tourist.surname,
        );
        _dateOfBirthController.value = _dateOfBirthController.value.copyWith(
          text: tourist.dateOfBirth,
        );
        _nationalityController.value = _nationalityController.value.copyWith(
          text: tourist.nationality,
        );
        _foreignPassportNumberController.value =
            _foreignPassportNumberController.value.copyWith(
          text: tourist.foreignPassportNumber,
        );
        _expiryDateOfThePassportController.value =
            _expiryDateOfThePassportController.value.copyWith(
          text: tourist.expiryDateOfThePassport,
        );

        widgetToShow = SectionCardWidget(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: kTextStyleMedium.copyWith(fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () {
                      chosenWithWrapped(isWrapped: true);
                    },
                    icon: const Icon(
                      Icons.expand_less_rounded,
                      color: kBlueIconColor,
                    ),
                    style: kIconButtonStyle,
                  ),
                ],
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Имя',
                controller: _nameController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    name: value,
                  ),
                ),
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Фамилия',
                controller: _surnameController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    surname: value,
                  ),
                ),
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Дата Рождения',
                controller: _dateOfBirthController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    dateOfBirth: value,
                  ),
                ),
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Гражданство',
                controller: _nationalityController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    nationality: value,
                  ),
                ),
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Номер загранпаспорта',
                controller: _foreignPassportNumberController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    foreignPassportNumber: value,
                  ),
                ),
              ),
              TouristPropertyWidget(
                triedToPay: widget.triedToPay,
                label: 'Срок действия загранпаспорта',
                controller: _expiryDateOfThePassportController,
                onChanged: (value) => widget.bloc.add(
                  TouristsInfoChangeTouristEvent(
                    touristIndex: widget.index,
                    newTouristList: widget.bloc.state.touristList,
                    expiryDateOfThePassport: value,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        widgetToShow,
      ],
    );
  }
}
