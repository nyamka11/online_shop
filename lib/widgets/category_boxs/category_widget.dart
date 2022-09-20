import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_common/box_custom.dart';

import '../../data/categories_data.dart';

class CatBoxWidget extends StatelessWidget {
  final int index;

  const CatBoxWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costraints) {
        double w = costraints.maxWidth;
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.productListPage);
          },
          child: BoxCustomWidget(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  // height: 600,
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/61BUt5ZErdL._AC_SL1500_.jpg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    height: 60,
                    width: w,
                    color: Colors.blue[300],
                    child: Text(
                      categories[index].catName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
