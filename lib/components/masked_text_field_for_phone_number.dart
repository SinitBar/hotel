import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/blocs/payer_data/payer_data_bloc.dart';
import '../constants.dart';
import 'masked_text_controller_helper.dart';

class MaskedTextFieldForPhoneNumber extends StatefulWidget {
  const MaskedTextFieldForPhoneNumber({
    super.key,
    required this.payerDataBloc,
  });

  final PayerDataBloc payerDataBloc;

  @override
  State<MaskedTextFieldForPhoneNumber> createState() =>
      _MaskedTextFieldForPhoneNumberState();
}

class _MaskedTextFieldForPhoneNumberState
    extends State<MaskedTextFieldForPhoneNumber> {
  late final TextEditingController _controller;
  late Color backgroundColor;

  @override
  void initState() {
    _controller = TextEditingController();
    backgroundColor = kBackgroundScreenColor;
    _controller.text = widget.payerDataBloc.state.phone;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final helper = MaskedTextControllerHelper();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: BlocBuilder<PayerDataBloc, PayerDataState>(
        builder: (context, state) {
          return TextField(
            controller: _controller,
            onTap: () {
              if (_controller.text.isEmpty) {
                _controller.text = '***) ***-**-**';
                _controller.selection =
                    TextSelection.fromPosition(const TextPosition(offset: 0));
              }
            },
            onTapOutside: (_) {
              setState(() {
                backgroundColor = (_controller.text.contains('*'))
                    ? kErrorTextFieldFillColor
                    : kBackgroundScreenColor;
              });
              widget.payerDataBloc.add(
                PayerDataChangeEvent(
                  phoneNumber: _controller.text,
                  emailAddress: state.email,
                ),
              );
              print(
                  'changed PHONE to ${_controller.text} and email to ${state.email}');
            },
            onSubmitted: (_) {
              setState(() {
                backgroundColor = (_controller.text.contains('*'))
                    ? kErrorTextFieldFillColor
                    : kBackgroundScreenColor;
              });
              widget.payerDataBloc.add(
                PayerDataChangeEvent(
                  phoneNumber: _controller.text,
                  emailAddress: state.email,
                ),
              );
              print(
                  'changed PHONE to ${_controller.text} and email to ${state.email}');
            },
            keyboardType: TextInputType.phone,
            style: kTextStyleRegular.copyWith(fontSize: 16),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              prefixText: '+7 (',
              prefixStyle: kTextStyleRegular.copyWith(fontSize: 16),
              labelText: 'Номер телефона',
              labelStyle: kTextStyleMedium.copyWith(
                color: kVeryLightGrayTextColor,
                fontSize: 17,
              ),
              floatingLabelStyle: kTextStyleMedium.copyWith(
                color: kVeryLightGrayTextColor,
              ),
            ),
            onChanged: (value) {
              _controller.text = helper.changeMaskWithUserData(value);
              _controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: _controller.text.indexOf('*')));
              widget.payerDataBloc.add(
                PayerDataChangeEvent(
                  phoneNumber: _controller.text,
                  emailAddress: state.email,
                ),
              );
              print(
                  'changed PHONE to ${_controller.text} and email to ${state.email}');
            },
          );
        },
      ),
    );
  }
}
