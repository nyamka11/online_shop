class CategoryModel {
  final int catId;
  final int cat_1;
  final int cat_2;
  final int cat_3;
  final String catName;
  final DateTime createDate;
  final DateTime updateDate;
  final DateTime deleteDate;
  final int validFlg;
  final DateTime expirationDate;

  CategoryModel({
    required this.catId,
    required this.cat_1,
    required this.cat_2,
    required this.cat_3,
    required this.catName,
    required this.createDate,
    required this.updateDate,
    required this.deleteDate,
    required this.validFlg,
    required this.expirationDate,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      catId: data['catId'] as int,
      cat_1: data['cat_1'] as int,
      cat_2: data['cat_2'] as int,
      cat_3: data['cat_3'] as int,
      catName: data['catName'] as String,
      createDate: DateTime.parse(data['createDate']),
      updateDate: DateTime.parse(data['updateDate']),
      deleteDate: DateTime.parse(data['deleteDate']),
      validFlg: data['validFlg'] as int,
      expirationDate: DateTime.parse(data['expirationDate']),
    );
  }
}
