// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';
import '../../widgets/input_controls/verify_number_input.dart';

class VerificationNumberConfirmPage extends StatefulWidget {
  const VerificationNumberConfirmPage({super.key});

  @override
  State<VerificationNumberConfirmPage> createState() =>
      _VerificationNumberConfirmPageState();
}

class _VerificationNumberConfirmPageState
    extends State<VerificationNumberConfirmPage> {
  List<TextEditingController> inputController = [];
  @override
  void initState() {
    inputController.clear();
    for (int i = 0; i < 6; i++) {
      inputController.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 6; i++) {
      inputController[i].dispose();
    }
    inputController.clear();
    super.dispose();
  }

  void checkValidNumber() {
    String inputNumber = "";
    for (var e in inputController) {
      if (e.text.isEmpty) break;
      inputNumber = inputNumber + e.text.trim();
    }
    if (inputNumber == "123456") {
      print("OKKK");
      Navigator.pushNamed(
        context,
        Routes.changePasswordPage,
      );
    } else if (inputNumber.length == 6) {
      print("Message haruulnaa");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizedBox dummySpaceBoxVer(double height) {
      return SizedBox(
        height: height,
      );
    }

    SizedBox dummySpaceBoxHor(double width) {
      return SizedBox(
        width: width,
      );
    }

    return MainLayoutTemplate(
      bgColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dummySpaceBoxVer(5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HOME ＞メール送信完了",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(15),
                const Text(
                  "ご入力いただいたメールアドレスへメールを送信いたしました。\nメールに記載の認証番号 ６桁を入力してください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VerifyNumberInput(
                      controller: inputController[0],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[1],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[2],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[3],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[4],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[5],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                  ],
                ),
                dummySpaceBoxVer(45),
                const Text(
                  "【ご注意】",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(10),
                const Text(
                  """
認証番号は１０分以内に入力してください。
また本画面を離れますと、パスワードの再設定はやり直しとなります。""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(30),
                const Text(
                  """
メールが届かない場合は、迷惑メール対策等により受信できない、あるいは、
迷惑メールフォルダに入っている可能性がございます。メールの設定をご確認ください。""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                dummySpaceBoxVer(30),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.loginPage,
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "＞ ログインページへ戻る",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                dummySpaceBoxVer(45),
              ],
            ),
          );
        },
      ),
    );
  }
}
