// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/buttons/my_button.dart';
import 'package:online_shop/widgets/input_controls/my_text_field.dart';
import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';

class TempRegisterPage extends StatefulWidget {
  const TempRegisterPage({super.key});

  @override
  State<TempRegisterPage> createState() => _TempRegisterPageState();
}

class _TempRegisterPageState extends State<TempRegisterPage> {
  final loginIdController = TextEditingController();

  final FocusNode loginIdFocusNode = FocusNode();
  String warningMsg = "";

  @override
  void initState() {
    warningMsg = "";
    super.initState();
  }

  @override
  void dispose() {
    loginIdController.dispose();
    loginIdFocusNode.dispose();
    warningMsg = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textFieldHeight = 40.0;
    SizedBox dummySpaceBox(double height) {
      return SizedBox(
        height: height,
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
                dummySpaceBox(5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HOME ＞会員登録お申し込み",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "会員登録",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "※本サービスへはお１人様１ユーザーアカウントのみご登録いただけます。 同じ方の複数アカウント登録は固くお断りします。\n"
                  "登録に使うメールアドレスは、通常お使いの常時連絡が取れるメールアドレスをご入力ください。\n"
                  "入力されたメールアドレスに仮登録案内メールを送信いたします。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                dummySpaceBox(15),
                SizedBox(
                  width: 580,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          """メールアドレス     """,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MyTextField(
                        height: textFieldHeight,
                        width: 350,
                        hintText: "メールアドレス",
                        controller: loginIdController,
                      )
                    ],
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "ご入力されたアドレスは、既に使用されています。\nエシカルの会員登録がお済みでないか、こちらよりご確認ください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                if (warningMsg != "") dummySpaceBox(15),
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                // if (warningMsg != "") dummySpaceBox(15),
                dummySpaceBox(45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ご登録に際しましては、",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            Uri.base.origin + Routes.privacyPolicyPdf,
                            "_blank");
                      },
                      child: const Text(
                        "利用環境条件",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      "、",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            Uri.base.origin + Routes.privacyPolicyPdf,
                            "_blank");
                      },
                      child: const Text(
                        "利用規約",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      "、",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            Uri.base.origin + Routes.privacyPolicyPdf,
                            "_blank");
                      },
                      child: const Text(
                        "プライバシーポリシーを",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "予めご一読ください。",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                ),
                const Text(
                  "ご同意の上、ご登録をお願いしております。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBox(45),

                MyButton(
                  h: 50,
                  w: 300,
                  text: "登録用メールを送信する",
                  color: Colors.blue,
                  onClick: () {
                    if (loginIdController.text.isEmpty) {
                      setState(() {
                        warningMsg = "メールアドレスを入力してください。";
                        loginIdFocusNode.requestFocus();
                      });
                      return;
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(loginIdController.text)) {
                      setState(() {
                        warningMsg = "不正なメールアドレスを入力されています。\nメールアドレスをやり直してください。";
                        loginIdFocusNode.requestFocus();
                      });
                      return;
                    }

                    Navigator.pushNamed(
                      context,
                      Routes.tempRegisteredPage,
                    );
                  },
                ),
                dummySpaceBox(30),
                const Text(
                  "メールに記載されたURL より本会員登録にお進みください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                dummySpaceBox(30),
                const Text(
                  "エシカルはSSL128bit 暗号化に対応しております。\n入力された情報は暗号化して送信されます。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                dummySpaceBox(45),
              ],
            ),
          );
        },
      ),
    );
  }
}
