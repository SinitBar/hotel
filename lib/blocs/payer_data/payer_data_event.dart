part of 'payer_data_bloc.dart';

@immutable
abstract class PayerDataEvent {}

class PayerDataChangeEvent extends PayerDataEvent{
PayerDataChangeEvent({
  required this.phoneNumber,
  required this.emailAddress,
});
final String phoneNumber;
final String emailAddress;
}