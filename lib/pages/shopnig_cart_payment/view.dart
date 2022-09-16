import 'dart:async';

import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_header.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_process.dart';

class ShopingCartPayment extends StatelessWidget {
  const ShopingCartPayment({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(Routes.shopingCartFinished),
    );

    return MainLayoutTemplate(
      padding: 20,
      bgColor: Color.fromARGB(255, 250, 250, 250),
      body: Column(
        children: [
          const Header(),
          SizedBox(height: 20),
          ProcessList(stepIndex: 2),
          Container(
            width: double.infinity,
            height: 450,
            child: Center(
              child: Column(
                children: const [
                  SizedBox(height: 100),
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("お支払い中..."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
