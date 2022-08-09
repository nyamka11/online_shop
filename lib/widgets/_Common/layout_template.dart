import 'package:flutter/material.dart';
import './footer.dart';
import './navbar.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget body;
  final Color bgColor;

  const LayoutTemplate({
    super.key,
    required this.body,
    this.bgColor = const Color(0xFFecf6fa),
  });

  @override
  Widget build(BuildContext context) {
    var currenWidth = MediaQuery.of(context).size.width;
    // print(currenWidth);

    double w = 0;
    if (currenWidth > 1300) {
      w = MediaQuery.of(context).size.width * 0.70;
    } else if (currenWidth > 1200) {
      w = MediaQuery.of(context).size.width * 0.85;
    } else {
      w = MediaQuery.of(context).size.width;
    }

    return Scaffold(
      endDrawer: const DrawarCustom(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFecf6fa),
          child: Column(
            children: [
              Navbar(),
              Container(
                color: const Color(0xFFecf6fa),
                child: Container(
                  width: w,
                  // height: MediaQuery.of(context).size.height,
                  color: bgColor,
                  child: Column(
                    children: [
                      body,
                    ],
                  ),
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
