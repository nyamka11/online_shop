import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';

import '../data/productData.dart';
import 'box_item.dart';

class BoxView extends StatelessWidget {
  final productDatas = products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "今月のお勧め商品",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            children: [
              for (var e in productDatas)
                BoxItem(
                  imageUrl: e.imageUrl,
                  productTitle: e.title,
                  productDescription: e.description,
                )
            ],
          ),
        ],
      ),
    );
  }
}
