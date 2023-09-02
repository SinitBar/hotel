import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'room_data_event.dart';
part 'room_data_state.dart';

class RoomDataBloc extends Bloc<RoomDataEvent, RoomDataState> {
  RoomDataBloc() : super(RoomDataInitial()) {
    on<RoomDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
