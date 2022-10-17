class BadgeModel {
  final int badgeId;
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
    required this.badgeId,
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

  factory BadgeModel.fromJson(Map<String, dynamic> data) {
    return BadgeModel(
      badgeId: data['badgeId'] as int,
      badgeName: data['badgeName'] as String,
      imageName: data['imageName'] as String,
      imagePath: data['imagePath'] as String,
      imageType: data['imageType'] as String,
      imageSize: (data['imageSize'] ?? "") as String,
      createDate: DateTime.parse(data['createDate']),
      updateDate: DateTime.parse(data['updateDate']),
      deleteDate: DateTime.parse(data['deleteDate']),
      validFlg: data['validFlg'] as int,
      expirationDate: DateTime.parse(data['expirationDate']),
    );
  }
}
