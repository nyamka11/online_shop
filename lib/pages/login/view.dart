// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../_routers.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/_common/http_helper.dart';
import '../../widgets/input_controls/my_text_field.dart';
import '../../widgets/buttons/my_button.dart';

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
  initState() {
    localStorage.removeWhere((key, value) => key == storageLoginId);
    warningMsg = "";
    _isObscure = true;
    super.initState();
  }

  Future _getSession() async {
    await SessionManager().destroy();
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
    _getSession();
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
            width: double.infinity,
            child: Column(
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
                MyTextField(
                  height: 40,
                  width: 350,
                  hintText: 'ログインID（メールアドレス）',
                  controller: loginIdController,
                  focusNode: loginIdFocusNode,
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
                MyTextField(
                  height: 40,
                  width: 350,
                  hintText: 'パスワード',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure,
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
                dummySpaceBox(30),
                MyButton(
                  h: 40,
                  w: 300,
                  text: "ログイン",
                  color: Colors.blue,
                  onClick: () async {
                    if (loginIdController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      setState(() {
                        warningMsg = "ログインID（メールアドレス）とパスワードを入力してください。";
                      });
                      return;
                    }

                    Map<String, dynamic> body = {
                      "mailAdd": loginIdController.text,
                      "pswd": passwordController.text,
                    };

                    Map res = await HTTPHelper().post("/login/login", body);

                    print(res["success"]);
                    if (res["success"] == false) {
                      setState(() {
                        warningMsg = res["message"];
                      });
                      return;
                    }

                    var sessionManager = SessionManager();
                    await sessionManager.set("isLogged", true);
                    await sessionManager.set(
                        "loggedUserName", res["data"]["userName"]);

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed(Routes.homePage);
                  },
                ),
                dummySpaceBox(15),
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
                MyButton(
                  h: 40,
                  w: 300,
                  text: "社員登録",
                  color: Colors.blue,
                  onClick: () {
                    Navigator.of(context).pushNamed(Routes.tempRegisterPage);
                  },
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
