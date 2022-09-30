// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/buttons/my_button.dart';
import 'package:online_shop/widgets/input_controls/my_text_field.dart';
import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';

import '../../widgets/input_controls/verify_number_input.dart';

class TempRegisterConfirmPage extends StatefulWidget {
  const TempRegisterConfirmPage({super.key});

  @override
  State<TempRegisterConfirmPage> createState() =>
      _TempRegisterConfirmPageState();
}

class _TempRegisterConfirmPageState extends State<TempRegisterConfirmPage> {
  List<TextEditingController> inputController = [];
  final loginIdController = TextEditingController();
  String warningMsg = "";

  @override
  void initState() {
    warningMsg = "";
    inputController.clear();
    for (int i = 0; i < 6; i++) {
      inputController.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    warningMsg = "";
    loginIdController.dispose();
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
                    "HOME ＞メール送信完了 ＞会員登録",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(15),
                const Text(
                  "会員登録の開始",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(65),
                const Text(
                  "【ご注意】",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(5),
                const Text(
                  "まだ会員登録は完了しておりません。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(5),
                const Text(
                  "【３ 時間以内】に本登録をお済ませください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(15),
                SizedBox(
                  width: 580,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          """ログインID（メールアドレス）""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MyTextField(
                        height: 40,
                        width: 350,
                        controller: loginIdController,
                        hintText: "メールアドレス",
                      ),
                    ],
                  ),
                ),
                dummySpaceBoxVer(30),
                const Text(
                  "メールで送られた ６桁の認証番号を入力してください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                dummySpaceBoxVer(30),
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
                dummySpaceBoxVer(30),
                // if (warningMsg != "") dummySpaceBoxVer(15),
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                dummySpaceBoxVer(45),
                MyButton(
                  h: 40,
                  w: 300,
                  color: Colors.blue,
                  text: "登録用メールを送信する",
                  onClick: () {
                    if (loginIdController.text.isEmpty) {
                      setState(() {
                        warningMsg = "メールアドレスを入力してください。";
                      });
                      return;
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(loginIdController.text)) {
                      setState(() {
                        warningMsg = "不正なメールアドレスを入力されています。\nメールアドレスをやり直してください。";
                      });
                      return;
                    }

                    Navigator.pushNamed(
                      context,
                      Routes.tempRegisteredPage,
                    );
                  },
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
