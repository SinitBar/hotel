part of 'booking_data_bloc.dart';

@immutable
@immutable
abstract class BookingDataState {
  BookingData get bookingData =>
      BookingData(); // to provide access to bookingData in every state
}

class BookingDataInitialState extends BookingDataState {}

class BookingDataLoadingState extends BookingDataState {}

class BookingDataLoadedState extends BookingDataState {
  BookingDataLoadedState(this._bookingData);
  final BookingData _bookingData;

  @override
  BookingData get bookingData => _bookingData;
}
