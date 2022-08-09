import 'package:flutter/material.dart';

class BoxItemFooter extends StatelessWidget {
  const BoxItemFooter({
    Key? key,
    required this.boxWidth,
    required this.productTitle,
    required this.productDescription,
  }) : super(key: key);

  final double boxWidth;
  final String productTitle;
  final String productDescription;

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
              padding: const EdgeInsets.all(6),
              child: Text(
                productTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
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
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Starts(),
                  Container(
                    alignment: Alignment.bottomLeft,
                    color: Colors.red,
                    child: Row(
                      children: [
                        MaterialButton(
                          color: Colors.red,
                          onPressed: () {},
                          textColor: Colors.white,
                          child: Icon(
                            Icons.shopping_cart_outlined,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
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

class Starts extends StatelessWidget {
  const Starts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 238, 171, 70),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 238, 171, 70),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 238, 171, 70),
          size: 16,
        ),
        Icon(
          Icons.star_half,
          color: Color.fromARGB(255, 238, 171, 70),
          size: 16,
        ),
        Icon(
          Icons.star_outline,
          color: Color.fromARGB(255, 238, 171, 70),
          size: 16,
        ),
        Text(
          "123",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
