// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final newPassController = TextEditingController();
  final checkPassController = TextEditingController();

  final FocusNode newPassFocusNode = FocusNode();
  String warningMsg = "";

  bool _isObscure = true;

  @override
  void initState() {
    warningMsg = "";
    _isObscure = true;
    super.initState();
  }

  @override
  void dispose() {
    warningMsg = "";
    _isObscure = true;
    newPassController.dispose();
    checkPassController.dispose();
    newPassFocusNode.dispose();
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

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.,#?!@$%^&*-]).{8,}$';
    RegExp regex = RegExp(pattern);
    var ignoreChars = ["@", ",", "."];

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
                    "HOME ＞パスワード再設定",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "パスワードを再設定します",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  "新しいパスワードを設定してください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBox(15),
                const Text(
                  """
パスワードは８桁以上、数字・英文字・記号をかならず全部使って設定してください。
英文字はは大文字・小文字 両方使って指定してください。
記号は @ / , . は使えません。""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBox(10),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "新しいパスワード",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // dummySpaceBox(15),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: newPassController,
                    focusNode: newPassFocusNode,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: '新しいパスワード',
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
                // dummySpaceBox(5),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "確認の為新しいパスワードを再入力してください。",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // dummySpaceBox(15),
                SizedBox(
                  height: textFieldHeight,
                  width: 350,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "パスワードの再入力（確認用）",
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
                    controller: checkPassController,
                    // focusNode: newPassFocusNode,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: 'パスワードの再入力（確認用）',
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

                if (warningMsg != "") dummySpaceBox(15),
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                dummySpaceBox(45),
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    if (newPassController.text.length < 8) {
                      setState(() {
                        warningMsg = "パスワードの桁数が足りません。　８桁以上で指定してください。";
                      });
                      return;
                    }

                    if (!regex.hasMatch(newPassController.text)) {
                      setState(() {
                        warningMsg =
                            "パスワードの形式が違います。必ず数字・英文字（大小）・記号　を全て使ってください。";
                      });
                      return;
                    }

                    if (newPassController.text != checkPassController.text) {
                      setState(() {
                        warningMsg = "確認入力の内容とはじめに指定したパスワードが違います。";
                      });
                      return;
                    }

                    String lastChar = "";

                    for (int i = 0;
                        i < newPassController.text.length - 1;
                        i++) {
                      if (lastChar == newPassController.text[i]) {
                        setState(() {
                          warningMsg = "同じ文字が繰り返し指定されています。";
                        });
                        return;
                      }
                      lastChar = newPassController.text[i];
                    }

                    if (newPassController.text != checkPassController.text) {
                      setState(() {
                        warningMsg = "確認入力の内容とはじめに指定したパスワードが違います。";
                      });
                      return;
                    }

                    for (var element in ignoreChars) {
                      if (newPassController.text.contains(element)) {
                        setState(() {
                          warningMsg = "禁止文字　（@ / , . ）が使われています。";
                        });
                        return;
                      }
                    }

                    Navigator.pushNamed(
                      context,
                      Routes.passwordChanged,
                    );
                  },
                  child: SizedBox(
                    height: textFieldHeight,
                    width: 300,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'パスワードを変更する',
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
