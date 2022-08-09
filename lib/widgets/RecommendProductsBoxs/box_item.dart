import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_Common/box_custom.dart';

import 'box_item_footer.dart';
import 'box_item_header.dart';

class BoxItem extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final String price;

  const BoxItem({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    required this.productDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costraints) {
        double w = costraints.maxWidth;
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.productList);
          },
          child: BoxCustom(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                BoxItemHeader(w: w, price: price),
                BoxItemFooter(
                  boxWidth: w,
                  productTitle: productTitle,
                  productDescription: productDescription,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
