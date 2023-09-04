part of 'rooms_data_bloc.dart';

@immutable
abstract class RoomsDataState {
  RoomsData get roomsData => RoomsData();
}

class RoomsDataInitialState extends RoomsDataState {}

class RoomsDataLoadingState extends RoomsDataState {}

class RoomsDataLoadedState extends RoomsDataState {
  RoomsDataLoadedState(this._roomsData);
  final RoomsData _roomsData;

  @override
  RoomsData get roomsData => _roomsData;
}
