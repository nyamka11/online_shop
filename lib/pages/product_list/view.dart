import 'package:flutter/material.dart';
import 'package:online_shop/data/badge.dart';
import 'package:online_shop/data/product_data.dart';
import 'package:online_shop/models/badge.dart';
import 'package:online_shop/models/product.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/product_list_row/product_list_row.dart';
import '../../widgets/right_window/view.dart';
import 'top_bar.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<ProductModel> productList = products;
  List<ProductModel> productListWhere = [];

  List<BadgeModel> badgetList = badgeData;
  List<BadgeModel> bagdeDataListWhere = [];

  _badgeWhere(badgeStr, badgeId) {
    var str = badgeStr.split('');
    if (str[badgeId - 1] == "1") {
      print(str.join(""));
      print("------------");
      return str.join();
    }
    return "";
  }

  void onClickSearchButton(categroyId, bagdeId) {
    if (categroyId == 0 && bagdeId == 0) {
      productListWhere = products;
    } else if (categroyId == 0 && bagdeId > 0) {
      productListWhere = products.where((element) {
        return element.badgeFlag == _badgeWhere(element.badgeFlag, bagdeId);
      }).toList();
    } else if (categroyId > 0 && bagdeId == 0) {
      productListWhere = products.where((element) {
        return element.cat_1 == categroyId ||
            element.cat_2 == categroyId ||
            element.cat_3 == categroyId;
      }).toList();
    } else {
      productListWhere = products.where((element) {
        return ((element.cat_1 == categroyId ||
                element.cat_2 == categroyId ||
                element.cat_3 == categroyId) &&
            (element.badgeFlag == _badgeWhere(element.badgeFlag, bagdeId)));
      }).toList();
    }

    setState(() {
      productList = productListWhere;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            TopBar(onClickSearchButton),
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
                        return ListRows(productItem: productList[index]);
                      },
                      itemCount: productList.length,
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
