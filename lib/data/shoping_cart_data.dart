import 'package:online_shop/models/shoping_cart_item.dart';

import '../models/product.dart';

final List<ShopingCartItemModel> shopingCartListItems = [
  ShopingCartItemModel(
    id: 'sc1',
    quantity: 2,
    product: ProductModel(
      id: 'p2',
      title: 'Flutter State Management 1111111',
      description: 'Everything you should know about Flutter State.',
      imageUrl:
          'https://m.media-amazon.com/images/I/719F0Zu9veL._AC_SL1500_.jpg',
      morePics: [
        'https://m.media-amazon.com/images/I/719F0Zu9veL._AC_SL1500_.jpg',
        'https://m.media-amazon.com/images/I/515myPUnjaL._AC_SL1500_.jpg',
        'https://m.media-amazon.com/images/I/61BUt5ZErdL._AC_SL1500_.jpg',
      ],
      total: 2000,
      tax: 10,
      totalIncludingTax: 2020,
      badgeFlag: "100101",
    ),
  ),
  ShopingCartItemModel(
    id: 'sc2',
    quantity: 5,
    product: ProductModel(
      id: 'p1',
      title: 'Flutter State Management　ｄｄｄｄｄｄｄｄｄｄｄｄｄ',
      description: 'Everything you should know about Flutter State.',
      imageUrl:
          'https://m.media-amazon.com/images/I/515myPUnjaL._AC_SL1500_.jpg',
      morePics: [
        'https://m.media-amazon.com/images/I/719F0Zu9veL._AC_SL1500_.jpg',
        'https://m.media-amazon.com/images/I/515myPUnjaL._AC_SL1500_.jpg',
        'https://m.media-amazon.com/images/I/61BUt5ZErdL._AC_SL1500_.jpg',
      ],
      total: 2000,
      tax: 10,
      totalIncludingTax: 2020,
      badgeFlag: "100101",
    ),
  ),
];
