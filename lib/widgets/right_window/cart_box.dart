import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_routers.dart';
import '../../provider/shoping_cart_provider.dart';

class CartBox extends StatelessWidget {
  const CartBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shopingCardProvider = Provider.of<ShopingCartProvider>(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 99, 98, 98),
          ),
          child: Text(
            "カート (${shopingCardProvider.count})点",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 1000,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              right: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              bottom: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
            ),
            color: Colors.white,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              ...shopingCardProvider.cartListItems.map(
                (e) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.shopingCartPage);
                      },
                      child: Card(
                        elevation: 3,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                e.product.title,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "数量: ${e.quantity.toString()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text("会計: ${e.product.total}¥"),
                              const SizedBox(height: 3),
                              Text(
                                "税金: ${e.product.tax}%",
                                style: TextStyle(color: Colors.orange[900]),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "税込合計: ${e.product.totalIncludingTax}¥ (税込)",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                    ),
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
