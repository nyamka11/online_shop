import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            "aaaasdfasdfasdf\nasdfasfasdfasddaaaasdfasdfasdf\nasdfasfasdfasddaaaasdfasdfasdf\nasdfasfasdfasdd",
            style: TextStyle(color: Colors.white),
          ),
          Text("aaa"),
          Text("aaa"),
        ],
      ),
    );
  }
}
