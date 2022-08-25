import 'package:flutter/material.dart';
import './footer.dart';
import './navbar.dart';

class MainLayoutTemplate extends StatelessWidget {
  final Widget body;
  final Color bgColor;
  final double padding;

  const MainLayoutTemplate({
    super.key,
    required this.body,
    this.bgColor = const Color(0xFFecf6fa),
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    var currenWidth = MediaQuery.of(context).size.width;
    // print(currenWidth);

    double w = 0;
    if (currenWidth > 3800) {
      w = MediaQuery.of(context).size.width * 0.30;
    } else if (currenWidth > 2400) {
      w = MediaQuery.of(context).size.width * 0.50;
    } else if (currenWidth > 1300) {
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
              const Navbar(),
              Container(
                color: const Color(0xFFecf6fa),
                child: Container(
                  width: w,
                  // height: MediaQuery.of(context).size.height,
                  color: bgColor,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      children: [
                        body,
                      ],
                    ),
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
