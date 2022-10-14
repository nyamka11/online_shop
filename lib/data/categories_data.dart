import 'dart:async';

import 'package:online_shop/services/m_cateogory.dart';

import '../models/category.dart';

// Future<List<CategoryModel>> categories =
//     CategoryService.getAll() as Future<List<CategoryModel>>;


// final List<CategoryModel> categories = [
//   CategoryModel(
//     catId: 0,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'All',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 1,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Apparel & Accessories',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 2,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Style & Fashion',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 3,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Home & Garden',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 4,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Sporting Goods',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 5,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Health & Wellness',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
//   CategoryModel(
//     catId: 6,
//     cat_1: 2,
//     cat_2: 2,
//     cat_3: 2,
//     catName: 'Medical Health',
//     createDate: DateTime.now(),
//     updateDate: DateTime.now(),
//     deleteDate: DateTime.now().add(const Duration(days: 365)),
//     validFlg: 0,
//     expirationDate: DateTime.now().add(const Duration(days: 365)),
//   ),
// ];
