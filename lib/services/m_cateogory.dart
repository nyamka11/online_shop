import 'package:online_shop/widgets/_common/http_helper.dart';
import 'package:online_shop/models/category.dart';

class CategoryService {
  static Future<List<CategoryModel>> getAll() async {
    var catMap = await HTTPHelper().fetchItems("/mCategory/getAll");

    List<CategoryModel> listCateModel = [];

    for (var element in catMap) {
      listCateModel
          .add(CategoryModel.fromJson(element as Map<String, dynamic>));
    }

    return listCateModel;
  }

  static Future<List<CategoryModel>> getAllFetch() async {
    var catMap = await HTTPHelper().fetchItems("/mCategory/getAll");

    List<CategoryModel> listCateModel = [];

    for (var element in catMap) {
      listCateModel
          .add(CategoryModel.fromJson(element as Map<String, dynamic>));
    }

    return listCateModel;
  }
}
