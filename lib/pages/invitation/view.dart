// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:html' show Storage, window;

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/buttons/my_button.dart';
import '../../widgets/_Common/layout_template.dart';
import '../../_routers.dart';
import '../../widgets/check_box_custom.dart';
import 'dart:js' as js;

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final msgController = TextEditingController();
  List<TextEditingController> inputNameController = [];
  List<TextEditingController> inputEmailController = [];

  Storage localStorage = window.localStorage;

  String storageLoginId = "loggedUserName";
  String warningMsg = "";
  String code = "";
  bool inviteRuleVerifed = false;

  @override
  void initState() {
    code = "123456";
    warningMsg = "";
    inputNameController.clear();
    for (int i = 0; i < 10; i++) {
      inputNameController.add(TextEditingController());
    }

    inputEmailController.clear();
    for (int i = 0; i < 10; i++) {
      inputEmailController.add(TextEditingController());
    }

    String msg = """                      さん\n""".padLeft(40);
    msg = "$msg${"${localStorage[storageLoginId] ?? ""} ".padRight(38)}です。\n";
    // msg = "$msg ${localStorage[storageLoginId]} です。\n";
    msg = "$msg Emon Market の商品を紹介します。\n";
    msg = "$msg \nホームページのＵＲＬ　です。\n";
    msg = "$msg http://18.222.230.119/webpage\n";
    msg = "$msg \n会員登録の時に、下記の招待コードを入力していただけると\n私が招待した会員として登録されます。\n";
    msg = "$msg \n招待コード：$code\n";
    msg = "$msg \nこのサイトでは招待した会員がこのサイトで商品を購入すると、\n招待した人にポイントがつく仕組みがあります。\n";
    msg = "$msg \nエシカル商品を購入して、お友達を紹介してお得に買い物ができます。\n";
    msg = "$msg \n安心なエシカル商品を生活に取り入れる良い機会になると思います。\n";
    msg = "$msg 一度おとずれてみてください。\n";

    msgController.text = msg;

    super.initState();
  }

  @override
  void dispose() {
    warningMsg = "";

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

  @override
  Widget build(BuildContext context) {
    var textFieldHeight = 40.0;
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
                    "${"${localStorage[storageLoginId] ?? ""} ".padRight(38)}さん。      お友達を招待しましょう。",
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
                      dummySpaceBoxVer(25),
                      const Text(
                        "招待コード６桁を振り出しました。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      Text(
                        code,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          // fontSize: 10,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "注文控えのメールの他に、お友達の招待情報のメールを送付します。\n確認してください。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "招待例文と、招待コードを使ってお友達を招待してください。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "お友達を招待するボタンを押すまでは招待コードは有効になりません。",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 420,
                          maxHeight: 420,
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
                          controller: msgController,
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
                      dummySpaceBoxVer(30),
                      const Text(
                        "※「お友達の招待ルール」をお読みいただき,\n　 同意できる場合は、「同意する」をチェックしてください。",
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
                              html.window.open(
                                  Uri.base.origin + Routes.loginPage, "_blank");

                              // html.window.open(
                              //     'https://www.fluttercampus.com', "_self");
                              // html.window.open('https://www.fluttercampus.com',
                              //     "_blank", 'location=no');
                              // js.context.callMethod('open',
                              //     ['https://stackoverflow.com/questions/ask']);
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
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                if (warningMsg != "") dummySpaceBoxVer(15),
                MyButton(
                  h: 40,
                  w: 320,
                  color: Colors.blue,
                  text: "お友達を招待する。",
                  onClick: () {
                    if (!inviteRuleVerifed) {
                      setState(() {
                        warningMsg = "お友達の招待ルールを確認し同意してください。";
                      });
                      return;
                    }
                    Navigator.pushNamed(
                      context,
                      Routes.invitationResultPage,
                      arguments: {
                        'msgController': msgController,
                        'inputNameController': inputNameController,
                        'inputEmailController': inputEmailController,
                      },
                    );
                  },
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
