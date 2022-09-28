// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../widgets/_Common/layout_template.dart';

class MemberRegisteredPage extends StatelessWidget {
  const MemberRegisteredPage({super.key});

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
                    "HOME ＞会員登録完了",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(15),
                const Text(
                  "会員登録完了",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(45),
                const Text(
                  "会員登録が完了しました。" "\nエシカルEmon Market のサービスをご活用ください",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    dummySpaceBoxHor(30),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.loginPage,
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "＞ ログインする",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                dummySpaceBoxVer(90),
              ],
            ),
          );
        },
      ),
    );
  }
}
