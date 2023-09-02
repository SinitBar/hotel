import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_data_event.dart';
part 'booking_data_state.dart';

class BookingDataBloc extends Bloc<BookingDataEvent, BookingDataState> {
  BookingDataBloc() : super(BookingDataInitial()) {
    on<BookingDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
