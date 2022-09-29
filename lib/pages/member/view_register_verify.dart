import "package:flutter/material.dart";

import '../../widgets/_Common/layout_template.dart';
import '../../widgets/check_box_custom.dart';
import '../../widgets/input_controls/my_text_field.dart';

class MemberRegisterVerify extends StatelessWidget {
  const MemberRegisterVerify({super.key});

  Widget widthSpace(w) {
    return SizedBox(width: w);
  }

  Widget heightSpace(h) {
    return SizedBox(height: h);
  }

  Widget line() {
    return Container(
      height: 1,
      color: Colors.black54,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = 10;
    double w = 25;

    if (ModalRoute.of(context)!.settings.arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed('/');
      });
      return Container();
    }

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    TextEditingController userNameContorller =
        arguments['userNameContorller'] as TextEditingController;

    TextEditingController passwordContorller =
        arguments['passwordContorller'] as TextEditingController;

    TextEditingController repasswordContorller =
        arguments['repasswordContorller'] as TextEditingController;

    TextEditingController firstNameController =
        arguments['firstNameController'] as TextEditingController;

    TextEditingController lastNameContorller =
        arguments['lastNameContorller'] as TextEditingController;

    TextEditingController firstNameKataController =
        arguments['firstNameKataController'] as TextEditingController;

    TextEditingController lastNameKataController =
        arguments['lastNameKataController'] as TextEditingController;

    TextEditingController postCodeContorller =
        arguments['postCodeContorller'] as TextEditingController;

    TextEditingController address1Contorller =
        arguments['address1Contorller'] as TextEditingController;

    TextEditingController address2Contorller =
        arguments['address2Contorller'] as TextEditingController;

    TextEditingController address3Contorller =
        arguments['address3Contorller'] as TextEditingController;

    TextEditingController phoneNumberContorller =
        arguments['phoneNumberContorller'] as TextEditingController;

    TextEditingController otherPhoneNumberContorller =
        arguments['otherPhoneNumberContorller'] as TextEditingController;

    TextEditingController inviteMailContorller =
        arguments['inviteMailContorller'] as TextEditingController;

    TextEditingController inviteCodeContorller =
        arguments['inviteCodeContorller'] as TextEditingController;

    TextEditingController keyWordContorller =
        arguments['keyWordContorller'] as TextEditingController;

    bool isCheckBagde1 = arguments['isCheckBagde1'] as bool;
    bool isCheckBagde2 = arguments['isCheckBagde2'] as bool;
    bool isCheckBagde3 = arguments['isCheckBagde3'] as bool;
    bool isCheckBagde4 = arguments['isCheckBagde4'] as bool;
    bool isCheckBagde5 = arguments['isCheckBagde5'] as bool;
    bool isCheckBagde6 = arguments['isCheckBagde6'] as bool;

    return MainLayoutTemplate(
      bgColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    Text(
                      "HOME ＞会員登録＞お申込み内容の御確認",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 700,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    heightSpace(20),
                    const Text(
                      "お申し込み内容のご確認",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    heightSpace(h),
                    Row(
                      children: const [
                        Text(
                          "アカウント情報",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(10),
                    line(),
                    heightSpace(10),
                    Row(
                      children: const [
                        Text(
                          "ログインID（メールアドレス）",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "xxxxxxxxxxxx@xxxxxxxxx.com",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(10),
                    line(),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "ユーザー名",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 500,
                          controller: TextEditingController(
                            text: userNameContorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(30),
                    line(),
                    heightSpace(25),
                    Row(
                      children: const [
                        Text(
                          "【契約者情報】",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: const [
                        Text(
                          "※必ず正しい御本人の情報をご入力ください。不正なご入力は登録を解除させていただく場合もございます。\nまた、虚偽の情報を登録され、悪質な場合は関係機関に通報を致します。",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(25),
                    Row(
                      children: [
                        const Text(
                          "お名前（氏）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(50),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: TextEditingController(
                            text: firstNameController.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "お名前（名）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(50),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: TextEditingController(
                            text: lastNameContorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "フリガナ（氏）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(11),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: TextEditingController(
                            text: firstNameKataController.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "フリガナ（名）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(11),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: TextEditingController(
                            text: lastNameKataController.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "郵便番号",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(53),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 100,
                          controller: TextEditingController(
                            text: postCodeContorller.text,
                          ),
                          isReadOny: true,
                        ),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(40),
                    Row(
                      children: [
                        const Text(
                          "住所（都道府県 区 市）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(11),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(2),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: TextEditingController(
                            text: address1Contorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(7),
                    Row(
                      children: [
                        const Text(
                          "住所（町村番地）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(11),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(7),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: TextEditingController(
                            text: address2Contorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(7),
                    Row(
                      children: [
                        const Text(
                          "住所（建物 部屋番号等）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(11),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(2),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: TextEditingController(
                            text: address3Contorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "電話番号",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 200,
                          controller: TextEditingController(
                            text: phoneNumberContorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "予備連絡先番号",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(70),
                        MyTextField(
                          height: 40,
                          width: 200,
                          controller: TextEditingController(
                            text: otherPhoneNumberContorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Container(
                      width: double.infinity,
                      color: Colors.yellowAccent,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "【本サイトの会員から招待された方は招待情報をご確認ください】",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "※初回会員登録時に招待情報を「正しく」ご入力いただけませんと、\n招待者にポイント獲得の権利が付与されません。 ご注意ください。",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              heightSpace(h),
                              Row(
                                children: [
                                  const Text(
                                    "招待者メールアドレス",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  widthSpace(11),
                                  MyTextField(
                                    height: 40,
                                    width: 250,
                                    controller: TextEditingController(
                                      text: inviteMailContorller.text,
                                    ),
                                    isReadOny: true,
                                  ),
                                ],
                              ),
                              heightSpace(h),
                              Row(
                                children: [
                                  const Text(
                                    "招待コード",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  widthSpace(80),
                                  MyTextField(
                                    height: 40,
                                    width: 100,
                                    controller: TextEditingController(
                                      text: inviteCodeContorller.text,
                                    ),
                                    isReadOny: true,
                                  ),
                                  widthSpace(11),
                                  const Text(
                                    "招待メールに記載の英数文字６桁のコードが必要となります。",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heightSpace(20),
                    Row(
                      children: const [
                        Text(
                          "【アンケート】",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "■ 気になるエシカル商品の特色",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    heightSpace(20),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                          ],
                        ),
                        widthSpace(11),
                      ],
                    ),
                    heightSpace(15),
                    Row(
                      children: const [
                        Text(
                          "■ 気になるキーワード",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    heightSpace(3),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 690,
                          controller: TextEditingController(
                            text: keyWordContorller.text,
                          ),
                          isReadOny: true,
                        ),
                      ],
                    ),
                    heightSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "※訂正がある場合は　「戻る」ボタンを押して戻ってください。",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        widthSpace(w),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 102, 102, 102), //ボタンの背景色
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            child: Text(
                              '戻る',
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "利用環境条件、利用規約、プライバシーポリシー、に同意しました。",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    heightSpace(30),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 30,
                        ),
                        child: Text(
                          '申し込み内容を確認して登録する',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    heightSpace(100),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
