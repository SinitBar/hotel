import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/blocs/payer_data/payer_data_bloc.dart';
import '../constants.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.label,
    required this.validator,
    required this.payerDataBloc,
  });

  final String label;
  final bool Function(String) validator;
  final PayerDataBloc payerDataBloc;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late final TextEditingController emailController;
  late Color backgroundColor;
  late bool wasTapped;

  @override
  void initState() {
    backgroundColor = kBackgroundScreenColor;
    emailController = TextEditingController();
    emailController.text = widget.payerDataBloc.state.email;
    wasTapped = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            cursorColor: Colors.grey,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              labelStyle: kTextStyleMedium.copyWith(
                color: kVeryLightGrayTextColor,
                fontSize: 17,
              ),
              labelText: widget.label,
            ),
            onTap: () {
              setState(() {
                wasTapped = true;
              });
            },
            onSubmitted: (value) {
              setState(() {
                backgroundColor = EmailValidator.validate(emailController.text)
                    ? kBackgroundScreenColor
                    : kErrorTextFieldFillColor;
              });
              widget.payerDataBloc.add(
                PayerDataChangeEvent(
                  phoneNumber: state.phone,
                  emailAddress: emailController.text,
                ),
              );
              print(
                  'changed phone number to ${state.phone} and EMAIL to ${emailController.text}');
            },
            onTapOutside: (pointerDownEvent) {
              if (wasTapped) {
                setState(() {
                  backgroundColor =
                      EmailValidator.validate(emailController.text)
                          ? kBackgroundScreenColor
                          : kErrorTextFieldFillColor;
                });
                widget.payerDataBloc.add(
                  PayerDataChangeEvent(
                    phoneNumber: state.phone,
                    emailAddress: emailController.text,
                  ),
                );
                print(
                    'changed phone number to ${state.phone} and EMAIL to ${emailController.text}');
              }
            },
          );
        },
      ),
    );
  }
}
