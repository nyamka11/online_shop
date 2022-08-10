import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_Common/box_custom.dart';

class CatBoxItem extends StatelessWidget {
  final Color color;
  final String name;
  final String imageUrl;

  const CatBoxItem({
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
            Navigator.of(context).pushNamed(Routes.productList);
          },
          child: BoxCustom(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Image.network(
                    imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(17),
                    height: 60,
                    width: w,
                    color: color,
                    child: Text(
                      name,
                      style: TextStyle(
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
