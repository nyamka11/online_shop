import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/widgets/_common/box_custom.dart';
import 'box_widget_footer.dart';

class BoxWidget extends StatelessWidget {
  final ProductModel productItem;

  const BoxWidget({
    super.key,
    required this.productItem,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costraints) {
        double w = costraints.maxWidth;
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.productDetailPage,
                arguments: {"ProductItem": productItem});
          },
          child: BoxCustomWidget(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.network(
                      productItem.imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                BoxWidgetFooter(
                  boxWidth: w,
                  product: productItem,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
