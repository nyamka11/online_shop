import 'package:flutter/material.dart';
import '../../widgets/shoping_cart_pages_process.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/shoping_cart_pages_header.dart';

class ShopingCartFinished extends StatelessWidget {
  const ShopingCartFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      padding: 20,
      bgColor: Color.fromARGB(255, 250, 250, 250),
      body: Column(
        children: [
          const Header(),
          SizedBox(height: 20),
          ProcessList(stepIndex: 3),
          Container(
            width: double.infinity,
            height: 450,
            child: Center(
              child: Column(
                children: [
                  Text("oookkkkk..........."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
