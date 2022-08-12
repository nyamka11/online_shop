import 'package:flutter/material.dart';

import '../../data/recomment_data.dart';
import './box_widget.dart';

class BoxView extends StatelessWidget {
  const BoxView({super.key});

  Widget girdViewCustom(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1000
        ? GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: List.generate(
              recommentProducts.length,
              (index) => BoxWidget(
                imageUrl: recommentProducts[index].imageUrl,
                productTitle: recommentProducts[index].title,
                productDescription: recommentProducts[index].description,
                price: recommentProducts[index].price,
              ),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 0.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: recommentProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return BoxWidget(
                imageUrl: recommentProducts[index].imageUrl,
                productTitle: recommentProducts[index].title,
                productDescription: recommentProducts[index].description,
                price: recommentProducts[index].price,
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      // alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "今月のお勧め商品",
            style: TextStyle(fontSize: 20),
          ),
          girdViewCustom(context),
        ],
      ),
    );
  }
}
