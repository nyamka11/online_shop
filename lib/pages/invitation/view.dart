// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_Common/layout_template.dart';
import '../../_routers.dart';
import '../../widgets/check_box_custom.dart';
import '../../widgets/input_controls/input_invitation_info.dart';
import '../../widgets/input_controls/verify_number_input.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final addMsgController = TextEditingController();
  List<TextEditingController> inputNameController = [];
  List<TextEditingController> inputEmailController = [];
  List<TextEditingController> inputCodeController = [];

  Storage localStorage = window.localStorage;

  String storageLoginId = "loginId";
  String warningMsg = "";
  bool inviteRuleVerifed = false;

  @override
  void initState() {
    localStorage.removeWhere((key, value) => key == storageLoginId);
    warningMsg = "";
    addMsgController.text =
        " ${localStorage[storageLoginId]} です。\nEmon Market の商品を紹介します。";

    inputCodeController.clear();
    for (int i = 0; i < 6; i++) {
      inputCodeController.add(TextEditingController());
    }

    inputNameController.clear();
    for (int i = 0; i < 10; i++) {
      inputNameController.add(TextEditingController());
    }

    inputEmailController.clear();
    for (int i = 0; i < 10; i++) {
      inputEmailController.add(TextEditingController());
    }

    super.initState();
  }

  @override
  void dispose() {
    warningMsg = "";

    for (int i = 0; i < 6; i++) {
      inputCodeController[i].dispose();
    }
    inputCodeController.clear();

    for (int i = 0; i < 10; i++) {
      inputNameController[i].dispose();
    }
    inputNameController.clear();

    for (int i = 0; i < 10; i++) {
      inputEmailController[i].dispose();
    }
    inputEmailController.clear();

    super.dispose();
  }

  void inviteRuleVerifedFn(bool value) {
    setState(() {
      inviteRuleVerifed = value;
    });
  }

  void checkValidNumber() {
    // String inputNumber = "";
    // for (var e in inputCodeController) {
    //   if (e.text.isEmpty) break;
    //   inputNumber = inputNumber + e.text.trim();
    // }
    // if (inputNumber == "123456") {
    //   print("OKKK");
    // } else if (inputNumber.length == 6) {
    //   print("Message haruulnaa");
    // }
  }

  @override
  Widget build(BuildContext context) {
    var textFieldHeight = 40.0;
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
                dummySpaceBoxVer(5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${localStorage[storageLoginId]}  さん      お友達を招待しましょう。",
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
                      padding: const EdgeInsets.only(
                        top: 3,
                        bottom: 0,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " 終了     ＞＞",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
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
                        "メールの本文は下記の様に表示されます。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      dummySpaceBoxVer(5),
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
                          ],
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "追加のメッセージを編集してください。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 10,
                        ),
                      ),
                      dummySpaceBoxVer(10),
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 100,
                          maxHeight: 100,
                          minWidth: 500,
                          maxWidth: 500,
                        ),
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: TextField(
                          controller: addMsgController,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          expands: true,
                          maxLines: null,
                          // cursorHeight: 12,
                          style: const TextStyle(
                            height: 1.7,
                            // fontFamily: GoogleFonts.notoSansJavanese(),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Text(
                        """
※必ずメールだけではなく、招待したことをお友達に連絡をしてください。
迷惑メールにならないように、招待を受けてくださるお友達であることを確認してからお客様の責任で招待を送ってください。
最大１０名まで招待できます。""",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
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
                                  readOnly: false,
                                  inputNameController:
                                      inputNameController[e - 1],
                                  inputEmailController:
                                      inputEmailController[e - 1]),
                            ),
                          ],
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "※招待者の認証コード６桁を設定してください。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...[0, -1, 1, -1, 2, -1, 3, -1, 4, -1, 5].map(
                            (e) => e == -1
                                ? dummySpaceBoxHor(13)
                                : VerifyNumberInput(
                                    controller: inputCodeController[e],
                                    checkValidNumberCallBack: checkValidNumber,
                                  ),
                          ),
                        ],
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        """
※送る前にメールアドレスが間違っていないか、よく確認してから
「お友達を招待する」ボタンを押してください。
押すと直ちにメールが送信されます。
※「お友達の招待ルール」をお読みいただき同意できる場合は、「同意する」をチェックしてください。""",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              print("Click... お友達の招待ルール ");
                              // Navigator.pushNamed(
                              //   context,
                              //   Routes.forgetPasswordPage,
                              // );
                            },
                            child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "お友達の招待ルール  ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            """    お友達の招待ルールい関して  """,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                ),
                          ),
                          CheckBoxCustom(inviteRuleVerifedFn),
                          const Text(
                            """  同意する。""",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      dummySpaceBoxVer(15),
                    ],
                  ),
                ),
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.invitationResultPage,
                      arguments: {
                        'addMsgController': addMsgController,
                        'inputNameController': inputNameController,
                        'inputEmailController': inputEmailController,
                        'inputCodeController': inputCodeController,
                      },
                    );
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
                dummySpaceBoxVer(45),
              ],
            ),
          );
        },
      ),
    );
  }
}
