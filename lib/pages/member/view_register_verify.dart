import 'dart:convert';
import 'dart:html';

import "package:flutter/material.dart";

import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';
import '../../widgets/_common/http_helper.dart';
import '../../widgets/buttons/my_button.dart';
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

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
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

    final account = arguments["account"] as Map;
    final user = arguments["user"] as Map;

    bool isCheckBagde1 = toBoolean(user['isCheckBagde1']);
    bool isCheckBagde2 = toBoolean(user['isCheckBagde2']);
    bool isCheckBagde3 = toBoolean(user['isCheckBagde3']);
    bool isCheckBagde4 = toBoolean(user['isCheckBagde4']);
    bool isCheckBagde5 = toBoolean(user['isCheckBagde5']);
    bool isCheckBagde6 = toBoolean(user['isCheckBagde6']);

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
                      children: [
                        const Text(
                          "ログインID（メールアドレス）",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          account["email"],
                          style: const TextStyle(
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
                            text: account["userName"],
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
                            text: user["firstName"],
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
                            text: user["lastName"],
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
                            text: user["firstNameKata"],
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
                            text: user["lastNameKata"],
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
                            text: user["postCode"],
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
                            text: user["address1"],
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
                            text: user["address2"],
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
                            text: user["address3"],
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
                            text: user["phoneNumber"],
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
                            text: user["otherPhoneNumber"],
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
                                    bgColor: Colors.yellowAccent,
                                    controller: TextEditingController(
                                      text: user["inviteMail"],
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
                                    bgColor: Colors.yellowAccent,
                                    controller: TextEditingController(
                                      text: user["inviteCode"],
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
                        if (isCheckBagde1)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('1'),
                              ),
                            ],
                          ),
                        if (isCheckBagde2) widthSpace(11),
                        if (isCheckBagde2)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('2'),
                              ),
                            ],
                          ),
                        if (isCheckBagde3) widthSpace(11),
                        if (isCheckBagde3)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('3'),
                              ),
                            ],
                          ),
                        if (isCheckBagde4) widthSpace(11),
                        if (isCheckBagde4)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('4'),
                              ),
                            ],
                          ),
                        if (isCheckBagde5) widthSpace(11),
                        if (isCheckBagde5)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('5'),
                              ),
                            ],
                          ),
                        if (isCheckBagde6) widthSpace(11),
                        if (isCheckBagde6)
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('6'),
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
                            text: user["keyWord"],
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
                    MyButton(
                      h: 50,
                      w: 300,
                      color: Colors.pinkAccent,
                      onClick: () async {
                        Map response = await HTTPHelper().post("/user/add", {
                          "data": jsonEncode(arguments).toString(),
                        });

                        if (response["success"]) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context)
                              .pushNamed(Routes.memberRegisteredPage);
                        }
                      },
                      text: '申し込み内容を確認して登録する',
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
