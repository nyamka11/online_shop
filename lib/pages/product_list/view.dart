import 'package:flutter/material.dart';
import 'package:online_shop/data/product_data.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/product_list_row.dart';
import '../../widgets/right_window/view.dart';
// import 'row_item.dart';
import 'top_bar.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            const TopBar(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListRows(
                          index: index,
                          ctx: context,
                        );
                      },
                      itemCount: products.length,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: constraints.maxWidth * 0.25,
                      child: Column(
                        children: const [
                          RightWindow(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
