part of 'hotel_data_bloc.dart';

@immutable
abstract class HotelDataState {
  HotelData get hotelData =>
      HotelData(); // to provide access to hotelData in every state
}

class HotelDataInitial extends HotelDataState {}

class HotelDataLoadingState extends HotelDataState {}

class HotelDataLoadedState extends HotelDataState {
  HotelDataLoadedState(this._hotelData);
  final HotelData _hotelData;

  @override
  HotelData get hotelData => _hotelData;
}
