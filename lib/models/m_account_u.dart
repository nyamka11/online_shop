///ログイン情報（一般消費者）テーブルの構造体クラス
// 2022/09/12 G.M 新規作成
class MAccountUModel {
  ///会社コード
  final int cmpCd;

  ///ユーザー名
  final String userName;

  ///メールアドレス
  final String mailAdd;

  ///パスワード
  final String pswd;

  ///ユーザー有効期限
  final DateTime userExpDate;

  ///レベル
  final int level;

  ///最終パスワード変更日付
  final DateTime pswLastUpdate;

  ///パスワード更新日数
  final int pswLimitDay;

  ///作成日
  final DateTime createDate;

  ///更新日
  final DateTime updateDate;

  ///削除日
  final DateTime deleteDate;

  ///無効化区分
  final int validId;

  ///有効期限
  final DateTime expirationDate;

  MAccountUModel({
    required this.cmpCd,
    required this.userName,
    required this.mailAdd,
    required this.pswd,
    required this.userExpDate,
    required this.level,
    required this.pswLastUpdate,
    required this.pswLimitDay,
    required this.createDate,
    required this.updateDate,
    required this.deleteDate,
    required this.validId,
    required this.expirationDate,
  });
}
