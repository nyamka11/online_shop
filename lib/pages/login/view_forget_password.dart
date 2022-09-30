// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';
import 'package:online_shop/widgets/buttons/my_button.dart';
import 'package:online_shop/widgets/input_controls/my_text_field.dart';

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
                MyTextField(
                  height: textFieldHeight,
                  width: 360,
                  controller: loginIdController,
                  focusNode: loginIdFocusNode,
                  hintText: 'メールアドレス',
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
                MyButton(
                  h: 40,
                  w: 300,
                  text: "送信する",
                  color: Colors.blue,
                  onClick: () {
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
                ),

                dummySpaceBox(250),
              ],
            ),
          );
        },
      ),
    );
  }
}
