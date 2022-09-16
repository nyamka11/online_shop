import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class VerifyNumberInput extends StatelessWidget {
  VerifyNumberInput({
    Key? key,
    required this.controller,
    required this.checkValidNumberCallBack,
  }) : super(key: key);

  final TextEditingController controller;
  VoidCallback checkValidNumberCallBack;
  final double size = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
          UpperCaseTextFormatter(),
        ],
        textAlign: TextAlign.center,
        controller: controller,
        // cursorHeight: size,
        // showCursor: false,
        decoration: InputDecoration(
          hintText: "*",
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 216, 211, 211),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            checkValidNumberCallBack();
          }
        },
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: oldValue.selection,
    );
  }
}
