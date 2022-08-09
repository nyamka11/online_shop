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
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
