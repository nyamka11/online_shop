import 'package:flutter/material.dart';

class BoxCustom extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;

  const BoxCustom({
    super.key,
    this.width = 100,
    this.height = 100,
    this.child = const Text("Custom Box Widget"),
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 201, 200, 200))),
      // color: color,
      child: SizedBox(
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
