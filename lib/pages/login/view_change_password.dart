// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_common/http_helper.dart';
import '../../_routers.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/buttons/my_button.dart';

import '../../widgets/input_controls/my_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  final String email;
  const ChangePasswordPage({super.key, required this.email});

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
                MyTextField(
                  height: textFieldHeight,
                  width: 360,
                  controller: newPassController,
                  focusNode: newPassFocusNode,
                  hintText: '新しいパスワード',
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
                MyTextField(
                  height: textFieldHeight,
                  width: 360,
                  controller: checkPassController,
                  hintText: 'パスワードの再入力（確認用）',
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
                MyButton(
                  h: 40,
                  w: 300,
                  color: Colors.blue,
                  text: "パスワードを変更する",
                  onClick: () async {
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

                    Map<String, dynamic> body = {
                      "mailAdd": widget.email,
                      "pswd": newPassController.text,
                    };

                    Map res =
                        await HTTPHelper().post("/login/updatePswd", body);

                    if (res["success"] == false) {
                      setState(() {
                        warningMsg = res["message"];
                      });
                      return;
                    }

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      Routes.passwordChanged,
                    );
                  },
                ),
                dummySpaceBox(120),
              ],
            ),
          );
        },
      ),
    );
  }
}
