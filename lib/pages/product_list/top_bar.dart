import 'package:flutter/material.dart';
import 'package:online_shop/models/badge.dart';
import 'package:online_shop/services/m_cateogory.dart';

import '../../models/category.dart';
import '../../services/m_badge.dart';

class TopBar extends StatefulWidget {
  Function changeSearchContitionEvent;
  int forgetChosedCategoryId;

  TopBar({
    super.key,
    required this.changeSearchContitionEvent,
    required this.forgetChosedCategoryId,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedCatId = 0;
  int selectedBadgeId = 0;
  List<CategoryModel> categoryList = [];
  List<BadgeModel> bagdeList = [];

  @override
  void initState() {
    super.initState();
    getDataCategory();
    getDataBagde();
  }

  void getDataCategory() async {
    Future<List<CategoryModel>> categoriesFuture =
        CategoryService.getAll(context);
    var categoriesAll = await categoriesFuture;

    if (mounted) {
      setState(() {
        categoryList = categoriesAll;
      });
    }
  }

  void getDataBagde() async {
    Future<List<BadgeModel>> badgeFuture = BadgeService.getAll();
    var badgeAll = await badgeFuture;

    if (mounted) {
      setState(() {
        bagdeList = badgeAll;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 15,
          ),
          child: const Text(
            "以下の高品は、正会員の登録をすると購入できます。",
            style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  " カテゴリ",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Text(
                  "条件 : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  width: 200,
                  height: 35,
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: selectedCatId,
                    items: categoryList
                        .map(
                          (value) => DropdownMenuItem(
                            value: value.catId,
                            child: Text(value.catName),
                          ),
                        )
                        .toList(),
                    onChanged: (id) {
                      setState(() {
                        selectedCatId = id!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "バッチ : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  width: 200,
                  height: 35,
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: selectedBadgeId,
                    items: bagdeList
                        .map(
                          (value) => DropdownMenuItem(
                            value: value.badgeId,
                            child: Text(value.badgeName),
                          ),
                        )
                        .toList(),
                    onChanged: (id) {
                      setState(() {
                        selectedBadgeId = id!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: (() => widget.changeSearchContitionEvent(
                      selectedCatId, selectedBadgeId)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black87, //ボタンの背景色
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      '検査',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "新 着 順",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  " あいうえお順",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
