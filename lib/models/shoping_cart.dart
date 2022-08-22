import 'package:online_shop/models/product.dart';

class ShopingCartModel {
  String id;
  int quantity;
  ProductModel product;

  ShopingCartModel({
    this.id = "sc1",
    required this.quantity,
    required this.product,
  });
}
