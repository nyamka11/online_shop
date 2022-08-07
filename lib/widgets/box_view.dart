import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';

import '../data/productData.dart';
import 'box_item.dart';

class BoxView extends StatelessWidget {
  final productDatas = products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: SizedBox(
          height: 800,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  // color: Colors.red,
                  child: BoxItem(
                    imageUrl: products[index].imageUrl,
                    productTitle: products[index].title,
                    productDescription: products[index].description,
                  ),
                );
              })

          // GridView.count(
          //   crossAxisCount: 3,
          //   children: [
          //     ...products.map((e) => BoxItem(
          //           imageUrl: e.imageUrl,
          //           productTitle: e.title,
          //           productDescription: e.description,
          //         ))
          //   ],
          // )

          // GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //     ),
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //           height: 400,
          //           color: Colors.red,
          //           child: Text(products[index].price.toString()));
          //       // if (index >= grid.length) {
          //       //   grid.addAll(["pic0", "pic1", "pic2", "pic3", "pic4", "pic5",]);
          //       // }
          //       // return _photoItem(grid[index]);
          //     })

          // GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //         maxCrossAxisExtent: 800,
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20),
          //     itemCount: products.length,
          //     itemBuilder: (BuildContext ctx, index) {
          //       return BoxItem(
          //         imageUrl: products[index].imageUrl,
          //         productTitle: products[index].title,
          //         productDescription: products[index].description,
          //       );
          //     }),
          ),
    );
  }
}
