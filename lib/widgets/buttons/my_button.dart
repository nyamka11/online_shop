import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double h;
  final double w;
  final String text;
  final Color color;
  final Function onClick;

  const MyButton({
    super.key,
    required this.h,
    required this.w,
    required this.text,
    this.color = Colors.white,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton(
        onPressed: () => onClick(),
        style: ElevatedButton.styleFrom(primary: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
