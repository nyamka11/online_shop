class ProductModel {
  final String id;
  final int cat_1;
  final int cat_2;
  final int cat_3;
  final String title;
  final String description;
  final int paramId;
  final String imageUrl;
  final List morePics;
  final double total;
  final double tax;
  final double totalIncludingTax;
  final String badgeFlag;

  ProductModel({
    required this.id,
    required this.cat_1,
    required this.cat_2,
    required this.cat_3,
    required this.title,
    required this.description,
    required this.paramId,
    required this.imageUrl,
    required this.morePics,
    required this.total,
    required this.tax,
    required this.totalIncludingTax,
    required this.badgeFlag,
  });
}
