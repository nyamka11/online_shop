class CategoryModel {
  final int id;
  late final String catName;
  final DateTime createDate;
  final DateTime updateDate;
  final DateTime deleteDate;
  final int validFlg;
  final DateTime expirationDate;

  CategoryModel({
    required this.id,
    required this.catName,
    required this.createDate,
    required this.updateDate,
    required this.deleteDate,
    required this.validFlg,
    required this.expirationDate,
  });
}
