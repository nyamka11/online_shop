import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';

import '../data/shoping_cart_data.dart';

class ShopingCart with ChangeNotifier {
  final cartList = shopingCartList;

  int get count => cartList.length;

  void addItem(ProductModel item) {
    cartList.add(item);
    notifyListeners();
  }

  void reset() {
    cartList.clear();
    notifyListeners();
  }
}
