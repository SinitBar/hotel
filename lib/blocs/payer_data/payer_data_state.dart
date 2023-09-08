part of 'payer_data_bloc.dart';

@immutable
abstract class PayerDataState {
  get email => '';
  get phone => '';
  get canPay => false;
}

class PayerDataInitialState extends PayerDataState {}

class PayerDataChangedState extends PayerDataState {
  PayerDataChangedState({
    this.email = '',
    this.phone = '',
    this.canPay = false,
  });
  @override
  final String email;
  @override
  final String phone;
  @override
  final bool canPay;
}
