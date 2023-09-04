import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_provider/data_provider.dart';

part 'booking_data_event.dart';
part 'booking_data_state.dart';

class BookingDataBloc extends Bloc<BookingDataEvent, BookingDataState> {
  BookingDataBloc() : super(BookingDataInitialState()) {
    on<BookingDataLoadEvent>(_onLoadEvent);
  }

  _onLoadEvent(
      BookingDataLoadEvent loadEvent, Emitter<BookingDataState> emit) async {
    emit(BookingDataLoadingState());
    print('in on load event');
    final bookingData = await DataProvider().getBookingData();
    emit(BookingDataLoadedState(bookingData));
  }
}
