import 'package:online_shop/widgets/_common/http_helper.dart';
import '../models/badge.dart';

class BadgeService {
  static Future<List<BadgeModel>> getAll() async {
    // var badgeMap = await HTTPHelper().fetchItems("/mBadge/getAll");

    List<BadgeModel> listBadgeModel = [
      BadgeModel(
        badgeId: 0,
        badgeName: 'All',
        imageName: '.../',
        imagePath: '/../',
        imageType: 'png',
        imageSize: '220kb',
        createDate: DateTime.now(),
        updateDate: DateTime.now(),
        deleteDate: DateTime.now().add(const Duration(days: 365)),
        validFlg: 0,
        expirationDate: DateTime.now().add(const Duration(days: 365)),
      ),
    ];

    // for (var element in badgeMap) {
    //   listBadgeModel.add(BadgeModel.fromJson(element as Map<String, dynamic>));
    // }

    return listBadgeModel;
  }
}
