import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController? controller;
  final String? hintText;
  final Color bgColor;
  final bool isReadOny;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;

  const MyTextField({
    super.key,
    required this.height,
    required this.width,
    this.controller,
    this.hintText,
    this.bgColor = Colors.white,
    this.isReadOny = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      width: widget.width,
      height: widget.height,
      child: TextField(
        readOnly: widget.isReadOny,
        autofocus: false,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          border: widget.isReadOny
              ? null
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
        ),
      ),
    );
  }
}
