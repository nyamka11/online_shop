import 'package:flutter/material.dart';
import 'package:online_shop/models/shoping_cart.dart';

import '../data/shoping_cart_data.dart';

class ShopingCartProvider with ChangeNotifier {
  final cartList = shopingCartList;

  int get count => cartList.length;

  void addItem(ShopingCartModel item) {
    //以前カートに中入れたとかを確認します。
    if (cartList.isNotEmpty) {
      List filteredItems =
          cartList.where((i) => i.product.id == item.product.id).toList();

      if (filteredItems.isNotEmpty) {
        filteredItems.first.quantity += item.quantity;
        notifyListeners();
        return;
      }
    }

    cartList.add(item);
    notifyListeners();
  }

  void reset() {
    cartList.clear();
    notifyListeners();
  }
}
