import 'package:flutter/material.dart';

import '../../data/productData.dart';
import './box_item.dart';

class BoxView extends StatelessWidget {
  final productDatas = products;

  BoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // alignment: Alignment.center,
      color: Color.fromARGB(255, 231, 230, 230),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "今月のお勧め商品",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 360,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext ctx, index) {
                return BoxItem(
                  imageUrl: products[index].imageUrl,
                  productTitle: products[index].title,
                  productDescription: products[index].description,
                  price: products[index].price.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
