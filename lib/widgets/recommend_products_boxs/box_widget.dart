import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_common/box_custom.dart';
import 'box_widget_footer.dart';

class BoxWidget extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final double price;

  const BoxWidget({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    required this.productDescription,
    required this.price,
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
          child: BoxCustomWidget(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  // height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                BoxWidgetFooter(
                  boxWidth: w,
                  productTitle: productTitle,
                  productDescription: productDescription,
                  price: price,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
