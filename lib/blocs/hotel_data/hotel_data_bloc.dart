import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data_provider/data_provider.dart';

part 'hotel_data_event.dart';
part 'hotel_data_state.dart';

class HotelDataBloc extends Bloc<HotelDataEvent, HotelDataState> {
  HotelDataBloc() : super(HotelDataInitial()) {
    on<HotelDataLoadEvent>(_onLoadEvent);
  }

  _onLoadEvent(
      HotelDataLoadEvent loadEvent, Emitter<HotelDataState> emit) async {
    emit(HotelDataLoadingState());
    final hotelData = await DataProvider().getHotelData();
    emit(HotelDataLoadedState(hotelData));
  }
}
