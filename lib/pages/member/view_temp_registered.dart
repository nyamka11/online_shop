// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';

class TempRegisteredPage extends StatelessWidget {
  const TempRegisteredPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox dummySpaceBoxVer(double height) {
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
                  "ご入力いただいたメールアドレスへメールを送信いたしました。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
                const Text(
                  "メールに記載されたURL より本会員登録にお進みいただき、会員登録を完了してください。"
                  "\nメールが届かない場合は、迷惑メール対策等により受信できない、あるいは、"
                  "\n迷惑メールフォルダに入っている可能性がございます。メールの設定をご確認ください。",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                dummySpaceBoxVer(45),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.homePage,
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "＞ トップページへ戻る",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                dummySpaceBoxVer(220),
              ],
            ),
          );
        },
      ),
    );
  }
}
