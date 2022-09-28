import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController controller;
  final String hintText;

  const MyTextField({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    this.hintText = "",
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: widget.width,
      height: widget.height,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            // color: Colors.redAccent,
            fontSize: 13,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
