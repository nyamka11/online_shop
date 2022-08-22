import 'package:flutter/material.dart';

import '../../models/product.dart';

class PictureLayout extends StatefulWidget {
  final ProductModel productItem;
  final double constWidth;

  const PictureLayout({
    Key? key,
    required this.productItem,
    required this.constWidth,
  }) : super(key: key);

  @override
  State<PictureLayout> createState() => _PictureLayoutState();
}

class _PictureLayoutState extends State<PictureLayout> {
  String bigFrameImageUrl = "";

  @override
  void initState() {
    super.initState();
    bigFrameImageUrl = widget.productItem.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(
            right: 10,
            top: 10,
            left: 10,
          ),
          width: widget.constWidth * 0.7 / 2,
          height: widget.constWidth * 0.7 / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(255, 146, 146, 146),
            ),
          ),
          child: Image.network(bigFrameImageUrl),
        ),
        Row(
          children: [
            ...widget.productItem.morePics.map(
              (path) => InkWell(
                onTap: () {
                  setState(() {
                    bigFrameImageUrl = path;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 146, 146, 146),
                    ),
                  ),
                  child: Image.network(path),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
