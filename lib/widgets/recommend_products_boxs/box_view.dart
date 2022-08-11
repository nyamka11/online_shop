import 'package:flutter/material.dart';

import '../../data/product_data.dart';
import './box_widget.dart';

class BoxView extends StatelessWidget {
  final productDatas = products;

  BoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "今月のお勧め商品",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 0.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext ctx, index) {
              return BoxWidget(
                imageUrl: products[index].imageUrl,
                productTitle: products[index].title,
                productDescription: products[index].description,
                price: products[index].price.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
