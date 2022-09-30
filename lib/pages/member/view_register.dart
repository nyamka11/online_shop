import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/input_controls/my_text_field.dart';

import '../../widgets/_Common/layout_template.dart';
import '../../widgets/check_box_custom.dart';

class MemberRegister extends StatefulWidget {
  const MemberRegister({super.key});

  @override
  State<MemberRegister> createState() => _MemberRegisterState();
}

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

Widget requiredText() {
  return Container(
    color: const Color.fromARGB(255, 255, 98, 86),
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
    child: const Text(
      "必須",
      style: TextStyle(
        color: Colors.white,
        fontSize: 11,
      ),
    ),
  );
}

class _MemberRegisterState extends State<MemberRegister> {
  double h = 10;
  double w = 25;

  bool isCheckBagde1 = false;
  bool isCheckBagde2 = false;
  bool isCheckBagde3 = false;
  bool isCheckBagde4 = false;
  bool isCheckBagde5 = false;
  bool isCheckBagde6 = false;
  bool isAgree = false;

  final userNameContorller = TextEditingController();
  final passwordContorller = TextEditingController();
  final repasswordContorller = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameContorller = TextEditingController();
  final firstNameKataController = TextEditingController();
  final lastNameKataController = TextEditingController();
  final postCodeContorller = TextEditingController();
  final address1Contorller = TextEditingController();
  final address2Contorller = TextEditingController();
  final address3Contorller = TextEditingController();
  final phoneNumberContorller = TextEditingController();
  final otherPhoneNumberContorller = TextEditingController();
  final inviteMailContorller = TextEditingController();
  final inviteCodeContorller = TextEditingController();
  final keyWordContorller = TextEditingController();

  List<String> errorMsg = [];

  // List<String> errorMsg = [];
  bool errorMsgShow = false;

  void isAgreeFn(bool value) {
    isAgree = value;
  }

  void isCheckBagde1Fn(bool value) {
    isCheckBagde1 = value;
  }

  void isCheckBagde2Fn(bool value) {
    isCheckBagde2 = value;
  }

  void isCheckBagde3Fn(bool value) {
    isCheckBagde3 = value;
  }

  void isCheckBagde4Fn(bool value) {
    isCheckBagde4 = value;
  }

  void isCheckBagde5Fn(bool value) {
    isCheckBagde5 = value;
  }

  void isCheckBagde6Fn(bool value) {
    isCheckBagde6 = value;
  }

  @override
  Widget build(BuildContext context) {
    var datas = {
      'userNameContorller': userNameContorller,
      'passwordContorller': passwordContorller,
      'repasswordContorller': repasswordContorller,
      'firstNameController': firstNameController,
      'lastNameContorller': lastNameContorller,
      'firstNameKataController': firstNameKataController,
      'lastNameKataController': lastNameKataController,
      'postCodeContorller': postCodeContorller,
      'address1Contorller': address1Contorller,
      'address2Contorller': address2Contorller,
      'address3Contorller': address3Contorller,
      'phoneNumberContorller': phoneNumberContorller,
      "otherPhoneNumberContorller": otherPhoneNumberContorller,
      'inviteMailContorller': inviteMailContorller,
      'inviteCodeContorller': inviteCodeContorller,
      'keyWordContorller': keyWordContorller,
      'isAgree': isAgree,
      'isCheckBagde1': isCheckBagde1,
      'isCheckBagde2': isCheckBagde2,
      'isCheckBagde3': isCheckBagde3,
      'isCheckBagde4': isCheckBagde4,
      'isCheckBagde5': isCheckBagde5,
      'isCheckBagde6': isCheckBagde6,
    };

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
                      "HOME ＞会員登録",
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
                      "会員登録",
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
                    heightSpace(30),
                    Row(
                      children: const [
                        Text(
                          "※メールアドレスの変更は本画面ではできません。\n変更が必要な場合は、改めて最初から登録をしなおしてください。",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: [
                        const Text(
                          "ユーザー名",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(w),
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 500,
                          controller: userNameContorller,
                          hintText: "須 サイト画面やメールの本文に表示されます。",
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      children: const [
                        Text(
                          "パスワードは８桁以上、数字・英文字・記号をかならず全部使って設定してください。\n英文字はは大文字・小文字 両方使って指定してください。",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "パスワード",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(w),
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 500,
                          controller: passwordContorller,
                          hintText: "半角英数字8文字以上",
                        ),
                      ],
                    ),
                    heightSpace(20),
                    line(),
                    heightSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "パスワードの再入力（確認用）",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        widthSpace(w),
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 373,
                          controller: repasswordContorller,
                          hintText: "半角英数字8文字以上",
                        ),
                      ],
                    ),
                    heightSpace(25),
                    Row(
                      children: const [
                        Text(
                          "【契約者情報をご入力ください】",
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
                        widthSpace(w),
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: firstNameController,
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
                        widthSpace(w),
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: lastNameContorller,
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
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: firstNameKataController,
                          hintText: "全角カナ",
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
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 480,
                          controller: lastNameKataController,
                          hintText: "全角カナ",
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
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 100,
                          controller: postCodeContorller,
                        ),
                        widthSpace(w),
                        ElevatedButton(
                          onPressed: () {/* ボタンがタップされた時の処理 */},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 102, 102, 102), //ボタンの背景色
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Text(
                              '住所設定',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        widthSpace(w),
                        const Text(
                          "ハイフォン無し半角数字５桁",
                          style: TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        requiredText(),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(2),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: address1Contorller,
                          hintText: "全角カナ",
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
                        requiredText(),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(7),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: address2Contorller,
                          hintText: "全角カナ",
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
                        requiredText(),
                        widthSpace(w),
                      ],
                    ),
                    heightSpace(2),
                    Row(
                      children: [
                        MyTextField(
                          height: 40,
                          width: 680,
                          controller: address3Contorller,
                          hintText: "全角カナ",
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
                        requiredText(),
                        widthSpace(w),
                        MyTextField(
                          height: 40,
                          width: 200,
                          controller: phoneNumberContorller,
                        ),
                        widthSpace(w),
                        const Text(
                          "ハイフォン無し半角数字",
                          style: TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontWeight: FontWeight.bold,
                          ),
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
                          controller: otherPhoneNumberContorller,
                        ),
                        widthSpace(w),
                        const Text(
                          "ハイフォン無し半角数字",
                          style: TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontWeight: FontWeight.bold,
                          ),
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
                                "【本サイトの会員から招待された方は招待情報をご入力ください】",
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
                                    controller: inviteMailContorller,
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
                                    controller: inviteCodeContorller,
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
                          "■ 気になるエシカル商品の特色にチェックを入れてください。（複数指定可能）",
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
                            CheckBoxCustom(isCheckBagde1Fn),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                            CheckBoxCustom(isCheckBagde2Fn),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                            CheckBoxCustom(isCheckBagde3Fn),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                            CheckBoxCustom(isCheckBagde4Fn),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                            CheckBoxCustom(isCheckBagde5Fn),
                          ],
                        ),
                        widthSpace(11),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('logo'),
                            ),
                            CheckBoxCustom(isCheckBagde6Fn),
                          ],
                        ),
                        widthSpace(11),
                      ],
                    ),
                    heightSpace(15),
                    Row(
                      children: const [
                        Text(
                          "■ 気になるキーワードをお教えください。 （複数ある場合は 、［カンマ］で区切ってください。）",
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
                          controller: keyWordContorller,
                        ),
                      ],
                    ),
                    heightSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "本サービスをご利用いただくには、以下への同意が必要となります",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    heightSpace(3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "●利用環境条件",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            "●会員利用規約",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            "●プライバシーポリシー",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(25),
                    Row(
                      children: [
                        CheckBoxCustom(isAgreeFn),
                        const Text(
                          "利用環境条件、利用規約、プライバシーポリシー、に同意します。",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    heightSpace(30),
                    if (errorMsgShow)
                      SizedBox(
                        width: 400,
                        child: Column(
                          children: [
                            ...errorMsg.map((e) {
                              return Row(
                                children: [
                                  Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    heightSpace(30),
                    ElevatedButton(
                      onPressed: () {
                        List<String> errorMsgTmp = [];
                        if (userNameContorller.text == "") {
                          errorMsgTmp.add("・ユーザー名を入力してください。");
                        }
                        if (passwordContorller.text == "") {
                          errorMsgTmp.add("・パスワードを入力してください。");
                        }
                        if (repasswordContorller.text == "") {
                          errorMsgTmp.add("・パスワードの再入力（確認用）を入力してください。");
                        }
                        if (firstNameController.text == "") {
                          errorMsgTmp.add("・お名前（氏）を入力してください。");
                        }
                        if (lastNameContorller.text == "") {
                          errorMsgTmp.add("・お名前（名）を入力してください。");
                        }
                        if (firstNameKataController.text == "") {
                          errorMsgTmp.add("・フリガナ（氏）を入力してください。");
                        }
                        if (lastNameKataController.text == "") {
                          errorMsgTmp.add("・フリガナ（名）を入力してください。");
                        }
                        if (postCodeContorller.text == "") {
                          errorMsgTmp.add("・郵便番号を入力してください。");
                        }
                        if (address1Contorller.text == "") {
                          errorMsgTmp.add("・住所（都道府県 区 市）を入力してください。");
                        }
                        if (address2Contorller.text == "") {
                          errorMsgTmp.add("・住所（町村番地）を入力してください。");
                        }
                        if (address3Contorller.text == "") {
                          errorMsgTmp.add("・住所（建物 部屋番号等）を入力してください。");
                        }
                        if (phoneNumberContorller.text == "") {
                          errorMsgTmp.add("・電話番号を入力してください。");
                        }

                        setState(() {
                          errorMsgShow = true;
                          errorMsg = errorMsgTmp;
                        });

                        if (errorMsg.isEmpty) {
                          Navigator.of(context).pushNamed(
                            Routes.memberRegisterVerifyPage,
                            arguments: datas,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            const Color.fromARGB(255, 102, 102, 102), //ボタンの背景色
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 30,
                        ),
                        child: Text(
                          '申し込み内容を確認する',
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
