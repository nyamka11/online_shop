import 'package:flutter/material.dart';
import 'package:online_shop/models/shoping_cart_item.dart';

import '../data/shoping_cart_data.dart';

class ShopingCartProvider with ChangeNotifier {
  final cartListItems = shopingCartListItems;
  int get count => cartListItems.length;

  void addItem(ShopingCartItemModel item) {
    //以前カートに中入れたとかを確認します。
    if (cartListItems.isNotEmpty) {
      List filteredItems =
          cartListItems.where((i) => i.product.id == item.product.id).toList();

      if (filteredItems.isNotEmpty) {
        filteredItems.first.quantity += item.quantity;
        notifyListeners();
        return;
      }
    }

    cartListItems.add(item);
    notifyListeners();
  }

  void reset() {
    cartListItems.clear();
    notifyListeners();
  }
}
