import 'package:online_shop/models/product.dart';

class ShopingCartItemModel {
  String id;
  int quantity;
  ProductModel product;

  ShopingCartItemModel({
    this.id = "sc1",
    required this.quantity,
    required this.product,
  });
}
