import 'package:bloc/bloc.dart';
import 'package:hotel/blocs/tourists_info/tourist.dart';
import 'package:meta/meta.dart';

part 'tourists_info_event.dart';
part 'tourists_info_state.dart';

class TouristsInfoBloc extends Bloc<TouristsInfoEvent, TouristsInfoState> {
  TouristsInfoBloc() : super(TouristsInfoInitialState()) {
    on<TouristsInfoAddTouristEvent>(_onAddTourist);
    on<TouristsInfoChangeTouristEvent>(_onChangeTourist);
    on<TouristsInfoTryPayEvent>(_onTryPay);
  }
  _onAddTourist(
      TouristsInfoAddTouristEvent addEvent, Emitter<TouristsInfoState> emit) {
    emit(TouristsInfoAddedTouristState(touristList: addEvent.touristList));
  }

  _onChangeTourist(TouristsInfoChangeTouristEvent changeEvent,
      Emitter<TouristsInfoState> emit) {
    emit(TouristsInfoChangedTouristState(touristList: changeEvent.touristList));
  }

  _onTryPay(TouristsInfoTryPayEvent event, Emitter<TouristsInfoState> emit) {
    final payerDataFilled = event.payerDataFilled;
    final touristList = event.touristList;

    emit(
      TouristsInfoCheckedPayState(
        canPay: (Tourist.validate(touristList) && payerDataFilled),
        touristList: touristList,
      ),
    );
  }
}
