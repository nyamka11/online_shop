import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/shoping_cart_provider.dart';

class CartBox extends StatelessWidget {
  const CartBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shopingCard = Provider.of<ShopingCart>(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 99, 98, 98),
          ),
          child: Text(
            "カート (${shopingCard.count})点",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              right: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              bottom: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              ...shopingCard.cartList.map(
                (e) => Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            e.title,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text("会計: ${e.total}¥"),
                          SizedBox(height: 3),
                          Text(
                            "会計: ${e.tax}%",
                            style: TextStyle(color: Colors.orange[900]),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "会計: ${e.totalIncludingTax}¥ (税込)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
