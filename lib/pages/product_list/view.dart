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

  bool isInit = false;
  int searchCatId = 0;
  int searchBadgeId = 0;

  _badgeWhere(badgeStr, badgeId) {
    var str = badgeStr.split('');
    if (str[badgeId - 1] == "1") {
      return str.join();
    }
    return "";
  }

  void changeSearchContitionEvent(categroyId, bagdeId) {
    setState(() {
      searchCatId = categroyId;
      searchBadgeId = bagdeId;
    });
  }

  List<ProductModel> getData(categroyId, bagdeId) {
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

    return productListWhere;
  }

  @override
  Widget build(BuildContext context) {
    var chosedCatId = ModalRoute.of(context)!.settings.arguments;
    int forgetChosedCategoryId = chosedCatId == null ? 0 : chosedCatId as int;

    List<ProductModel> data = [];

    if (!isInit) {
      data = getData(forgetChosedCategoryId, 0);
      isInit = true;
    } else {
      data = getData(searchCatId, searchBadgeId);
    }

    return MainLayoutTemplate(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            TopBar(
              changeSearchContitionEvent: changeSearchContitionEvent,
              forgetChosedCategoryId: forgetChosedCategoryId,
            ),
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
                        return ListRows(productItem: data[index]);
                      },
                      itemCount: data.length,
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
