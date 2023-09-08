part of 'tourists_info_bloc.dart';

@immutable
abstract class TouristsInfoEvent {}

class TouristsInfoAddTouristEvent extends TouristsInfoEvent {
  TouristsInfoAddTouristEvent({
    required this.touristList,
  }) {
    touristList.add(Tourist());
  }
  final List<Tourist> touristList;
}

class TouristsInfoChangeTouristEvent extends TouristsInfoEvent {
  TouristsInfoChangeTouristEvent({
    required int touristIndex,
    required List<Tourist> newTouristList,
    String? name,
    String? surname,
    String? dateOfBirth,
    String? nationality,
    String? foreignPassportNumber,
    String? expiryDateOfThePassport,
  }) {
    newTouristList[touristIndex] = Tourist(
      name: name ?? newTouristList[touristIndex].name,
      surname: surname ?? newTouristList[touristIndex].surname,
      dateOfBirth: dateOfBirth ?? newTouristList[touristIndex].dateOfBirth,
      nationality: nationality ?? newTouristList[touristIndex].nationality,
      foreignPassportNumber: foreignPassportNumber ??
          newTouristList[touristIndex].foreignPassportNumber,
      expiryDateOfThePassport: expiryDateOfThePassport ??
          newTouristList[touristIndex].expiryDateOfThePassport,
    );
    touristList = newTouristList;
  }
  late final List<Tourist> touristList;
}

class TouristsInfoTryPayEvent extends TouristsInfoEvent {
  TouristsInfoTryPayEvent({
    required this.touristList,
    required this.payerDataFilled,
  });
  final List<Tourist> touristList;
  final bool payerDataFilled;
}
