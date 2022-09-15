// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/data/m_account_u_data.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginIdController = TextEditingController();
  final passwordController = TextEditingController();

  final FocusNode loginIdFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  Storage localStorage = window.localStorage;

  bool _isObscure = true;

  String storageLoginId = "loginId";
  String warningMsg = "";

  @override
  void initState() {
    localStorage.removeWhere((key, value) => key == storageLoginId);
    warningMsg = "";
    _isObscure = true;
    super.initState();
  }

  @override
  void dispose() {
    loginIdController.dispose();
    passwordController.dispose();
    loginIdFocusNode.dispose();
    passwordFocusNode.dispose();
    warningMsg = "";
    _isObscure = true;
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
            // color: Colors.amber,
            width: double.infinity,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                dummySpaceBox(5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HOME ＞ログイン",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "ログイン",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ログインID（メールアドレス）",
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
                      hintText: 'ログインID（メールアドレス）',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                dummySpaceBox(5),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "※ログインIDは会員登録完了メールに記載がございますので、お忘れの方はご確認をお願いいたします。",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "パスワード",
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: 'パスワード',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: textFieldHeight,
                  width: 250,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.forgetPasswordPage,
                      );
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "＞パスワードを忘れた方はこちら",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    if (loginIdController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      setState(() {
                        warningMsg = "ログインID（メールアドレス）とパスワードを入力してください。";
                      });
                      return;
                    }

                    // if (loginIdController.text.isEmpty) {
                    //   ShowAlertDialog(context, "ログインID（メールアドレス）を入力してください。");
                    //   loginIdFocusNode.requestFocus();
                    //   return;
                    // }

                    // if (passwordController.text.isEmpty) {
                    //   ShowAlertDialog(context, "パスワードを入力してください。");
                    //   passwordFocusNode.requestFocus();
                    //   return;
                    // }

                    if (accountUsers
                        .where((element) =>
                            element.mailAdd == loginIdController.text)
                        .isEmpty) {
                      setState(() {
                        warningMsg = "ユーザーが登録されていません。ログインIDを確認してください。";
                      });
                      // ShowAlertDialog(
                      //     context, "ユーザーが登録されていません。\nログインIDを確認してください。");
                      return;
                    }

                    var user = accountUsers.firstWhere(
                        (element) => element.mailAdd == loginIdController.text);

                    if (user.pswd != passwordController.text) {
                      setState(() {
                        warningMsg = "パスワードが異なっています。パスワードを確認してください。";
                      });
                      // ShowAlertDialog(
                      //     context, "パスワードが異なっています。\nパスワードを確認してください。");
                      return;
                    }

                    localStorage[storageLoginId] = user.mailAdd;

                    Navigator.of(context).pushNamed(Routes.homePage);
                  },
                  child: SizedBox(
                    // padding: const EdgeInsets.only(top: 15, bottom: 15),
                    // width: double.infinity,
                    height: textFieldHeight,
                    width: 300,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'ログイン',
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
                dummySpaceBox(5),
                SizedBox(
                  height: textFieldHeight,
                  width: 300,
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed(Routes.productDetailPage,
                      //     arguments: productItem);
                      print("Click: ＞ログインID（メールアドレス）も不明となった方は、こちら");
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "＞ログインID（メールアドレス）も不明となった方は、こちら",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                dummySpaceBox(30),
                const Text(
                  "初めての方はこちら",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed(Routes.productDetailPage,
                    //     arguments: productItem);
                    print(
                        "Click: エシカルエーモンマーケット について！、\n利用環境条件、利用規約、プライバシーポリシー をご確認ください。");
                  },
                  child: const Text(
                    "エシカルエーモンマーケット について！、\n利用環境条件、利用規約、プライバシーポリシー をご確認ください。",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   RoutePath.MainMenu,
                    // );
                  },
                  child: SizedBox(
                    height: textFieldHeight,
                    width: 300,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '社員登録',
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

void ShowAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text('警告'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
