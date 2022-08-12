import 'package:flutter/material.dart';

class BoxWidgetFooter extends StatelessWidget {
  final double boxWidth;
  final String productTitle;
  final String productDescription;
  final double price;

  const BoxWidgetFooter({
    Key? key,
    required this.boxWidth,
    required this.productTitle,
    required this.productDescription,
    required this.price,
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
                productTitle,
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
                productDescription,
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
                    "¥$price",
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {},
                    textColor: Colors.white,
                    child: Icon(
                      Icons.shopping_cart_outlined,
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
