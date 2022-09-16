import '../models/m_account_u.dart';

final List<MAccountUModel> accountUsers = [
  MAccountUModel(
    cmpCd: 1,
    userName: '川村',
    mailAdd: 'c-kawamura@fkcinc.co.jp',
    pswd: 'Kawamura123',
    userExpDate: DateTime.now().add(const Duration(days: 365)),
    level: 0,
    pswLastUpdate: DateTime.now(),
    pswLimitDay: 100,
    createDate: DateTime.now(),
    updateDate: DateTime.now(),
    deleteDate: DateTime.now().add(const Duration(days: 365)),
    validId: 0,
    expirationDate: DateTime.now().add(const Duration(days: 365)),
  ),
  MAccountUModel(
    cmpCd: 2,
    userName: '二ム',
    mailAdd: 'unyamka@gmail.com',
    pswd: '123',
    userExpDate: DateTime.now().add(const Duration(days: 365)),
    level: 0,
    pswLastUpdate: DateTime.now(),
    pswLimitDay: 100,
    createDate: DateTime.now(),
    updateDate: DateTime.now(),
    deleteDate: DateTime.now().add(const Duration(days: 365)),
    validId: 0,
    expirationDate: DateTime.now().add(const Duration(days: 365)),
  ),
  MAccountUModel(
    cmpCd: 3,
    userName: 'ガリ',
    mailAdd: 'galindev@fkcinc.co.jp',
    pswd: 'Galia123',
    userExpDate: DateTime.now().add(const Duration(days: 365)),
    level: 0,
    pswLastUpdate: DateTime.now(),
    pswLimitDay: 100,
    createDate: DateTime.now(),
    updateDate: DateTime.now(),
    deleteDate: DateTime.now().add(const Duration(days: 365)),
    validId: 0,
    expirationDate: DateTime.now().add(const Duration(days: 365)),
  ),
  MAccountUModel(
    cmpCd: 4,
    userName: 'Test',
    mailAdd: 'test',
    pswd: '123',
    userExpDate: DateTime.now().add(const Duration(days: 365)),
    level: 0,
    pswLastUpdate: DateTime.now(),
    pswLimitDay: 100,
    createDate: DateTime.now(),
    updateDate: DateTime.now(),
    deleteDate: DateTime.now().add(const Duration(days: 365)),
    validId: 0,
    expirationDate: DateTime.now().add(const Duration(days: 365)),
  ),
];
