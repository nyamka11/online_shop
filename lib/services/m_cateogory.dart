import 'package:online_shop/widgets/_common/http_helper.dart';
import 'package:online_shop/models/category.dart';

class CategoryService {
  static Future<List<CategoryModel>> getAll(ctx) async {
    var catMap = await HTTPHelper().fetchItems("/mCategory/getAll");

    List<CategoryModel> listCateModel = [
      CategoryModel(
        catId: 0,
        cat_1: 2,
        cat_2: 2,
        cat_3: 2,
        catName: 'All',
        createDate: DateTime.now(),
        updateDate: DateTime.now(),
        deleteDate: DateTime.now().add(const Duration(days: 365)),
        validFlg: 0,
        expirationDate: DateTime.now().add(const Duration(days: 365)),
      ),
    ];

    for (var element in catMap) {
      listCateModel
          .add(CategoryModel.fromJson(element as Map<String, dynamic>));
    }
    return listCateModel;
  }
}
