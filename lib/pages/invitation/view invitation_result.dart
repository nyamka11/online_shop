// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';
import '../../widgets/input_controls/input_invitation_info.dart';

class InvitationResultPage extends StatefulWidget {
  const InvitationResultPage({super.key});

  @override
  State<InvitationResultPage> createState() => _InvitationResultPageState();
}

class _InvitationResultPageState extends State<InvitationResultPage> {
  TextEditingController addMsgController = TextEditingController();
  List<TextEditingController> inputNameController = [];
  List<TextEditingController> inputEmailController = [];
  List<TextEditingController> inputCodeController = [];

  Storage localStorage = window.localStorage;

  String storageLoginId = "loginId";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed('/');
      });
      return Container();
    }
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    addMsgController = arguments['addMsgController'] as TextEditingController;
    inputNameController =
        arguments['inputNameController'] as List<TextEditingController>;
    inputEmailController =
        arguments['inputEmailController'] as List<TextEditingController>;
    inputCodeController =
        arguments['inputCodeController'] as List<TextEditingController>;

    var inputCode = "";
    for (var element in inputCodeController) {
      inputCode = inputCode + element.text;
    }

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
            // color: Colors.amber,
            width: double.infinity,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dummySpaceBoxVer(5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    """${localStorage[storageLoginId]}  さん      お友達招待が完了いたしました。""",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(5),
                Row(
                  children: [
                    Container(
                      height: 25,
                      color: const Color.fromARGB(255, 26, 54, 114),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(
                        top: 3,
                        bottom: 0,
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          """招待設定＞＞      """,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      color: const Color.fromARGB(255, 26, 54, 114),
                      padding: const EdgeInsets.only(
                        top: 3,
                        bottom: 0,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          """ 終了            """,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                dummySpaceBoxVer(15),
                Container(
                  // color: Colors.amber,
                  constraints: const BoxConstraints(
                    // minHeight: 50,
                    // maxHeight: 200,
                    minWidth: 500,
                    maxWidth: 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "メールの本文は下記の様に編集されて送信されました。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      dummySpaceBoxVer(10),
                      Container(
                        constraints: const BoxConstraints(
                          // minHeight: 50,
                          // maxHeight: 200,
                          minWidth: 500,
                          maxWidth: 500,
                        ),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "＿＿＿＿＿＿様 始めまして Ｅmon Market です。",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Emon Market 会員の ${localStorage[storageLoginId]} さん が",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Emon Market 商品をご案内します。",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "下記サイトで、会員しか購入できない商品を購入できます。",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "会員登録をして購入しましょう。",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\n${addMsgController.text}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        """
※後ほど、会員登録内容のメールアドレスへ、招待した内容をお送りします。
必ず保管しておいてください。
お友達招待メールの内容控は、注文控で指定したアドレスではなく、
会員登録のメールアドレスに送られますので、お間違いのないようにお願いします。""",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(30),
                      Container(
                        constraints: const BoxConstraints(
                          // minHeight: 50,
                          // maxHeight: 200,
                          minWidth: 500,
                          maxWidth: 500,
                        ),
                        // color: Colors.amber,
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black),
                        // ),
                        // padding: const EdgeInsets.only(
                        //   left: 5,
                        //   right: 5,
                        // ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 20,
                                    maxHeight: 20,
                                    minWidth: 40,
                                    maxWidth: 40,
                                  ),
                                  // color: Color.fromARGB(255, 255, 178, 114),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 209, 171),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      )),
                                  child: const Text(
                                    "№",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 20,
                                    maxHeight: 20,
                                    minWidth: 230,
                                    maxWidth: 230,
                                  ),
                                  // color: Color.fromARGB(255, 255, 178, 114),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 209, 171),
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "表示送付先名",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 20,
                                    maxHeight: 20,
                                    minWidth: 230,
                                    maxWidth: 230,
                                  ),
                                  // color: Color.fromARGB(255, 255, 178, 114),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 209, 171),
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: const Text(
                                    "メールアドレス",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
                              (e) => InputInvitationInfo(
                                  rowNo: e,
                                  readOnly: true,
                                  inputNameController:
                                      inputNameController[e - 1],
                                  inputEmailController:
                                      inputEmailController[e - 1]),
                            ),
                          ],
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      Text(
                        """※招待者の認証コード６桁   $inputCode""",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      dummySpaceBoxVer(15),
                    ],
                  ),
                ),
                dummySpaceBoxVer(45),
              ],
            ),
          );
        },
      ),
    );
  }
}
