import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data_provider/data_provider.dart';

part 'rooms_data_event.dart';
part 'rooms_data_state.dart';

class RoomsDataBloc extends Bloc<RoomsDataEvent, RoomsDataState> {
  RoomsDataBloc() : super(RoomsDataInitialState()) {
    on<RoomsDataLoadEvent>(_onLoadEvent);
  }

  _onLoadEvent(
      RoomsDataLoadEvent loadEvent, Emitter<RoomsDataState> emit) async {
    emit(RoomsDataLoadingState());
    final roomsData = await DataProvider().getRoomsData();
    emit(RoomsDataLoadedState(roomsData));
  }
}
