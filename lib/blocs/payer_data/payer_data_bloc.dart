import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'payer_data_event.dart';
part 'payer_data_state.dart';

class PayerDataBloc extends Bloc<PayerDataEvent, PayerDataState> {
  PayerDataBloc() : super(PayerDataInitialState()) {
    on<PayerDataChangeEvent>(_onChangeEvent);
  }

  _onChangeEvent(PayerDataChangeEvent event, Emitter<PayerDataState> emit) {
    String email = event.emailAddress;
    String phone = event.phoneNumber;
    bool canPay = (email.isNotEmpty &&
        phone.isNotEmpty &&
        EmailValidator.validate(email) &&
        !phone.contains('*'));
    emit(PayerDataChangedState(email: email, phone: phone, canPay: canPay));
  }
}
