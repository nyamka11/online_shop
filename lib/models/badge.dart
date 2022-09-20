class BadgeModel {
  final int id;
  final String badgeName;
  final String imageName;
  final String imagePath;
  final String imageType;
  final String imageSize;

  final DateTime createDate;
  final DateTime updateDate;
  final DateTime deleteDate;
  final int validFlg;
  final DateTime expirationDate;

  BadgeModel({
    required this.id,
    required this.badgeName,
    required this.imageName,
    required this.imagePath,
    required this.imageType,
    required this.imageSize,
    required this.createDate,
    required this.updateDate,
    required this.deleteDate,
    required this.validFlg,
    required this.expirationDate,
  });
}
