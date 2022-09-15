// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
          var buttonStyle = ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
            padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
            minimumSize: MaterialStateProperty.all(const Size(100, 30)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          );
          return Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dummySpaceBox(5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HOME ＞パスワードを忘れた方",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "パスワードを忘れた方",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "会員登録いただいたメールアドレスを入力してください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBox(15),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "メールアドレス",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: loginIdController,
                    focusNode: loginIdFocusNode,
                    decoration: InputDecoration(
                      hintText: 'メールアドレス',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
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
                dummySpaceBox(30),
                const Text(
                  """
ご登録のメールアドレスへ仮パスワードをメール送信いたします。
仮パスワードはマイページのアカウント情報にて必ず変更をお願いします。
既に受信不能となっているメールアドレスの場合は、「こちら」よりお問い合わせください。""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBox(30),
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    if (loginIdController.text.isEmpty) {
                      setState(() {
                        warningMsg = "メールアドレスを入力してください。";
                        loginIdFocusNode.requestFocus();
                      });
                      return;
                    }

                    Navigator.pushNamed(
                      context,
                      Routes.verificationNumberConfirmPage,
                    );
                  },
                  child: SizedBox(
                    height: textFieldHeight,
                    width: 300,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '送信する',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
