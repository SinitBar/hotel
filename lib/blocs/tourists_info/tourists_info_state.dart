part of 'tourists_info_bloc.dart';

@immutable
abstract class TouristsInfoState {
  List<Tourist> get touristList => [Tourist()];
  bool get canPay => false;
}

class TouristsInfoInitialState extends TouristsInfoState {}

class TouristsInfoAddedTouristState extends TouristsInfoState {
  TouristsInfoAddedTouristState({required this.touristList});
  @override
  final List<Tourist> touristList;
}

class TouristsInfoChangedTouristState extends TouristsInfoState {
  TouristsInfoChangedTouristState({required this.touristList});
  @override
  final List<Tourist> touristList;
}

class TouristsInfoCheckedPayState extends TouristsInfoState {
  TouristsInfoCheckedPayState({
    required this.canPay,
    required this.touristList,
  });
  @override
  final bool canPay;
  @override
  final List<Tourist> touristList;
}
