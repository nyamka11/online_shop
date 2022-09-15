import 'package:flutter/material.dart';

import '../../models/shoping_cart_item.dart';
import '../../widgets/number_input.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.shopingCartItem,
    required this.constWidth,
  }) : super(key: key);

  final ShopingCartItemModel shopingCartItem;
  final double constWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (constWidth * 0.7) / 2 + 38,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            shopingCartItem.product.title,
            softWrap: true,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          const Text("新着/お勧め"),
          const SizedBox(height: 20),
          Text(
            "単価 ${shopingCartItem.product.total}¥",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "税率 99%",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 72, 0),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "金額 999,999¥",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const Text(
            "単価 999,999,999¥",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const Text(
            "会計 999,999,999¥",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                "数量: ",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Container(
                color: Colors.black12,
                width: 150,
                child: NumericStepButton(
                  onChanged: (int value) {
                    shopingCartItem.quantity = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(height: 100),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(221, 34, 34, 34),
                  child: Icon(
                    Icons.recycling,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(221, 34, 34, 34),
                  child: Icon(
                    Icons.language_sharp,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(221, 34, 34, 34),
                  child: Icon(
                    Icons.compost,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(221, 34, 34, 34),
                  child: Icon(
                    Icons.recycling,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
