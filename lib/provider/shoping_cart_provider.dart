import 'package:flutter/material.dart';
import 'package:online_shop/models/shoping_cart.dart';

import '../data/shoping_cart_data.dart';

class ShopingCartProvider with ChangeNotifier {
  final cartList = shopingCartList;

  int get count => cartList.length;

  void addItem(ShopingCartModel item) {
    // cartList.where((element) {
    //   if (element.product.id == item.product.id) {
    //     element.quantity += item.quantity;
    //   }
    // });

    ShopingCartModel filteredItem =
        cartList.where((c) => c.product.id == item.product.id).toList().first;
    print(filteredItem.id);

    // itemaa.quantity += item.quantity;

    // if (itemaa.id == "")
    // cartList.add(item);
    notifyListeners();
  }

  void reset() {
    cartList.clear();
    notifyListeners();
  }
}
