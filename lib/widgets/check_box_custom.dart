import 'package:flutter/material.dart';

class CheckBoxCustom extends StatefulWidget {
  final void Function(bool) callback;
  const CheckBoxCustom(this.callback, {super.key});

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
            widget.callback(_isChecked);
          });
        },
      ),
    );
  }
}
