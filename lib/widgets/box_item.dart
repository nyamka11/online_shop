import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';

class BoxItem extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String productDescription;

  const BoxItem({
    required this.imageUrl,
    required this.productTitle,
    required this.productDescription,
  });

  static const double boxWidth = 300;

  @override
  Widget build(BuildContext context) {
    print(double.infinity);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.productList);
      },
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: boxWidth,
                height: 100,
                color: Colors.black54,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        bottom: 8,
                        right: 8,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
