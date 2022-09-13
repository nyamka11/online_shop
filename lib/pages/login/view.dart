// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var containerWidth = MediaQuery.of(context).size.width * 0.4;
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
                    "HOME＞ログイン",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                Text(
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
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                dummySpaceBox(30),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[400]),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    minimumSize: MaterialStateProperty.all(const Size(100, 30)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Storage _localStorage = window.localStorage;

                    _localStorage['selected_id'] = "testasdfasdf";

                    print(_localStorage['selected_id']);

                    // User user = User('aaaa', 'bbbb');
                    // print(user.toJson());

                    // Navigator.pushNamed(
                    //   context,
                    //   RoutePath.MainMenu,
                    // );
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
                          decoration: TextDecoration.underline,
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
                dummySpaceBox(30),
                const Text(
                  "初めての方はこちら",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "エシカルエーモンマーケット について！、\n利用環境条件、利用規約、プライバシーポリシー をご確認ください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                    // fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                dummySpaceBox(15),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[400]),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    minimumSize: MaterialStateProperty.all(const Size(100, 30)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
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
                          decoration: TextDecoration.underline,
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
