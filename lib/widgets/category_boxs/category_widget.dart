import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_common/box_custom.dart';

class CatBoxWidget extends StatelessWidget {
  final Color color;
  final String name;
  final String imageUrl;

  const CatBoxWidget({
    super.key,
    required this.color,
    required this.name,
    required this.imageUrl,
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
                    imageUrl,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    height: 60,
                    width: w,
                    color: color,
                    child: Text(
                      name,
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
