import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/blocs/booking_data/booking_data_bloc.dart';
import 'package:hotel/blocs/payer_data/payer_data_bloc.dart';
import 'package:hotel/blocs/tourists_info/tourists_info_bloc.dart';
import 'package:hotel/screens/paid.dart';
import '../blocs/hotel_data/hotel_data_bloc.dart';
import '../blocs/tourists_info/tourist.dart';
import '../components/email_text_field.dart';
import '../components/masked_text_field_for_phone_number.dart';
import '../constants.dart';
import '../functions.dart';
import '../widgets/rating_widget.dart';
import '../widgets/section_card_widget.dart';
import '../widgets/stack_bottom_button.dart';
import '../widgets/text_item_widget.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  static const String id = 'booking_screen';

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late final TouristsInfoBloc touristsInfoBloc;
  late final BookingDataBloc bookingDataBloc;
  late final PayerDataBloc payerDataBloc;

  late bool triedToPay;

  @override
  void initState() {
    touristsInfoBloc = TouristsInfoBloc();
    bookingDataBloc = BookingDataBloc();
    payerDataBloc = PayerDataBloc();
    triedToPay = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => bookingDataBloc..add(BookingDataLoadEvent())),
        BlocProvider(create: (context) => touristsInfoBloc),
        BlocProvider(create: (context) => payerDataBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Бронирование',
            style: kTextStyleMedium,
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<BookingDataBloc, BookingDataState>(
            builder: (context, bState) {
              final booking = bState.bookingData;
              final sumPriceForOne = booking.tour_price +
                  booking.fuel_charge +
                  booking.service_charge;
              return BlocBuilder<PayerDataBloc, PayerDataState>(
                builder: (context, pState) {
                  print('pState = $pState');
                  return BlocBuilder<TouristsInfoBloc, TouristsInfoState>(
                    bloc: touristsInfoBloc,
                    builder: (context, tState) {
                      print('tState = $tState');
                      final tourists = tState.touristList;
                      final amountOfTourists = tourists.length;
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
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => kBlueIconColor),
                        ),
                        onPressed: () {
                          bool passedValidation =
                              pState.canPay && Tourist.validate(tourists);
                          if (passedValidation) {
                            Navigator.pushNamed(context, Paid.id);
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                actions: [
                                  Center(
                                      child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: const ButtonStyle(
                                      textStyle: MaterialStatePropertyAll(
                                        kTextStyleSemibold,
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        kLightBlueBackgroundColor,
                                      ),
                                    ),
                                    child: const Text(
                                      'Ok',
                                      style: kTextStyleSemibold,
                                    ),
                                  )),
                                ],
                                backgroundColor: kBackgroundScreenColor,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                titlePadding: const EdgeInsets.all(16),
                                title: const Text(
                                  'Оплата недоступна',
                                  style: kTextStyleSemibold,
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                content: const Text(
                                  'Для перехода к оплате необходимо заполнить все поля. Необходимо заполнить поля правильно, чтобы они не подсвечивались красным.',
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: kTextStyleMedium,
                                ),
                              ),
                            );
                          }
                          setState(() {
                            triedToPay = true;
                          });
                          print('tried to pay');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Оплатить ${fFormatMoneyString(
                              '${sumPriceForOne * amountOfTourists}',
                            )}',
                            textAlign: TextAlign.center,
                            style: kTextStyleMedium.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        body: ListView(
          children: [
            BlocBuilder<HotelDataBloc, HotelDataState>(
              builder: (context, state) {
                return SectionCardWidget(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SectionCardWidget(
                        color: const Color(0x33FFC700),
                        height: 29,
                        width: 149,
                        borderRadius: 5,
                        margin: const EdgeInsets.only(bottom: 4, top: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: RatingWidget(
                          rating: state.hotelData.rating,
                          ratingName: state.hotelData.rating_name,
                        ),
                      ),
                      Text(
                        state.hotelData.name,
                        style: kTextStyleMedium.copyWith(fontSize: 22),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 17,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                (states) => EdgeInsets.zero,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            child: Text(
                              state.hotelData.adress,
                              style: kTextStyleMedium.copyWith(
                                fontSize: 14,
                                color: const Color(0xFF0D72FF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            SectionCardWidget(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: BlocBuilder<BookingDataBloc, BookingDataState>(
                builder: (context, state) {
                  final booking = state.bookingData;
                  return Column(
                    children: [
                      TextIemWidget(
                        label: 'Вылет из',
                        value: booking.departure,
                      ),
                      TextIemWidget(
                        label: 'Страна, город',
                        value: booking.arrival_country,
                      ),
                      TextIemWidget(
                        label: 'Даты',
                        value:
                            '${booking.tour_date_start} - ${booking.tour_date_stop}',
                      ),
                      TextIemWidget(
                        label: 'Кол-во ночей',
                        value: booking.number_of_nights.toString(),
                      ),
                      TextIemWidget(
                        label: 'Отель',
                        value: booking.hotel_name,
                      ),
                      TextIemWidget(
                        label: 'Номер',
                        value: booking.room,
                      ),
                      TextIemWidget(
                        label: 'Питание',
                        value: booking.nutrition,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SectionCardWidget(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Информация о покупателе',
                    style: kTextStyleMedium.copyWith(fontSize: 22),
                  ),
                  TextFieldTapRegion(
                    child: MaskedTextFieldForPhoneNumber(
                      payerDataBloc: payerDataBloc,
                    ),
                  ),
                  TextFieldTapRegion(
                    child: EmailTextField(
                      label: 'Почта',
                      validator: EmailValidator.validate,
                      payerDataBloc: payerDataBloc,
                    ),
                  ),
                  Text(
                      'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный Вами номер и почту',
                      style: kTextStyleRegular.copyWith(
                          fontSize: 14, color: kLightGrayTextColor)),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<TouristsInfoBloc, TouristsInfoState>(
              builder: (context, state) {
                return TouristsSectionWidget(
                  touristsInfoBloc: touristsInfoBloc,
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            SectionCardWidget(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: BlocBuilder<BookingDataBloc, BookingDataState>(
                  builder: (context, state) {
                final booking = state.bookingData;
                return BlocBuilder<TouristsInfoBloc, TouristsInfoState>(
                    builder: (context, touristsState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextIemWidget(
                        label: 'Тур',
                        value: fFormatMoneyString(
                            '${booking.tour_price * touristsState.touristList.length}'),
                        textAlign: TextAlign.end,
                      ),
                      TextIemWidget(
                        label: 'Топливный сбор',
                        value: fFormatMoneyString(
                          '${booking.fuel_charge * touristsState.touristList.length}',
                        ),
                        textAlign: TextAlign.end,
                      ),
                      TextIemWidget(
                        label: 'Сервисный сбор',
                        value: fFormatMoneyString(
                          '${booking.service_charge * touristsState.touristList.length}',
                        ),
                        textAlign: TextAlign.end,
                      ),
                      TextIemWidget(
                        label: 'К оплате',
                        value: fFormatMoneyString(
                          '${(booking.tour_price + booking.fuel_charge + booking.service_charge) * touristsState.touristList.length}',
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  );
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}

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

class VisibilitySwitchPairWidget extends StatefulWidget {
  const VisibilitySwitchPairWidget({
    super.key,
    required this.label,
    required this.bloc,
    required this.index,
  });

  final String label;
  final TouristsInfoBloc bloc;
  final int index;

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
