class ProductModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List morePics;
  final double total;
  final double tax;
  final double totalIncludingTax;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.morePics,
    required this.total,
    required this.tax,
    required this.totalIncludingTax,
  });
}
