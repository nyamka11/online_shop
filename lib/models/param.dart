class ParamModel {
  final int paramId;
  final String paranName;
  int appKbn = 1;
  DateTime appStDate;
  final DateTime appEdDate;
  final int appPriceKbn;
  final int appType;
  final double appPricePer;
  final int appPointKbn;
  final int appPointAdd;
  final double appPointPer;
  final DateTime createDate;
  final DateTime updateDate;
  final DateTime deleteDate;
  final int validFlg;
  final DateTime expirationDate;

  ParamModel({
    required this.paramId,
    required this.paranName,
    required this.appKbn,
    required this.appStDate,
    required this.appEdDate,
    required this.appPriceKbn,
    required this.appType,
    required this.appPricePer,
    required this.appPointKbn,
    required this.appPointAdd,
    required this.appPointPer,
    required this.createDate,
    required this.updateDate,
    required this.deleteDate,
    required this.validFlg,
    required this.expirationDate,
  });
}
