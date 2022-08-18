import 'package:flutter/material.dart';

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
                    "¥${product.total}",
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
