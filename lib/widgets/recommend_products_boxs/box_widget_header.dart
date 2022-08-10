import 'package:flutter/material.dart';

class BoxItemHeader extends StatelessWidget {
  const BoxItemHeader({
    Key? key,
    required this.w,
    required this.price,
  }) : super(key: key);

  final double w;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: w + 10,
        height: 50,
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "¥$price",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 16),
            //   child: MaterialButton(
            //     color: Colors.white,
            //     onPressed: () {},
            //     textColor: Colors.black,
            //     padding: const EdgeInsets.all(10),
            //     shape: const CircleBorder(),
            //     child: const Icon(
            //       Icons.favorite_border,
            //       size: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
