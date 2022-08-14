import 'package:flutter/material.dart';
import 'package:online_shop/provider/shoping_cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class BoxWidgetFooter extends StatelessWidget {
  final double boxWidth;
  final ProductModel product;

  const BoxWidgetFooter({
    Key? key,
    required this.boxWidth,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shopingCard = Provider.of<ShopingCart>(context);

    return Positioned(
      bottom: 0,
      child: Container(
        width: boxWidth,
        height: 100,
        color: Colors.black54,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                product.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: "OpenSans",
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 6,
                bottom: 6,
                right: 6,
              ),
              child: Text(
                product.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: "OpenSans",
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥${product.price}",
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Tooltip(
                    message: "Add to cart",
                    height: 30,
                    // verticalOffset: ,
                    child: MaterialButton(
                      color: Colors.red,
                      onPressed: () => {
                        shopingCard.addItem(product),
                      },
                      textColor: Colors.white,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
