// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../widgets/buttons/my_button.dart';
import '../../widgets/_common/layout_template.dart';
import '../../_routers.dart';
import '../../widgets/check_box_custom.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final msgController = TextEditingController();
  List<TextEditingController> inputNameController = [];
  List<TextEditingController> inputEmailController = [];

  String storageLoginId = "loggedUserName";
  String? loggedUserName;
  String warningMsg = "";
  String code = "";
  bool inviteRuleVerifed = false;

  @override
  void initState() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000;
    code = randomNumber.toString();
    warningMsg = "";
    inputNameController.clear();
    for (int i = 0; i < 10; i++) {
      inputNameController.add(TextEditingController());
    }

    inputEmailController.clear();
    for (int i = 0; i < 10; i++) {
      inputEmailController.add(TextEditingController());
    }

    getSessionData();

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

  getSessionData() async {
    var tmpLoggedUserName = await SessionManager().get("loggedUserName");
    setState(() {
      loggedUserName = tmpLoggedUserName;
    });
  }

  void inviteRuleVerifedFn(bool value) {
    setState(() {
      inviteRuleVerifed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizedBox dummySpaceBoxVer(double height) {
      return SizedBox(
        height: height,
      );
    }

    String msg = """                      ??????\n""".padLeft(40);
    msg = "$msg${" $loggedUserName ".padRight(38)}?????????\n";
    // msg = "$msg ${localStorage[storageLoginId]} ?????????\n";
    msg = "$msg Emon Market ??????????????????????????????\n";
    msg = "$msg \n??????????????????????????????????????????\n";
    msg = "$msg http://18.222.230.119/webpage\n";
    msg = "$msg \n?????????????????????????????????????????????????????????????????????????????????\n??????????????????????????????????????????????????????\n";
    msg = "$msg \n??????????????????$code\n";
    msg = "$msg \n???????????????????????????????????????????????????????????????????????????????????????\n??????????????????????????????????????????????????????????????????\n";
    msg = "$msg \n????????????????????????????????????????????????????????????????????????????????????????????????\n";
    msg = "$msg \n?????????????????????????????????????????????????????????????????????????????????????????????\n";
    msg = "$msg ??????????????????????????????????????????\n";

    msgController.text = msg;

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
                    "${"$loggedUserName ".padRight(38)}?????????      ????????????????????????????????????",
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
                          """??????????????????      """,
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
                          " ??????     ??????",
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
                        "?????????????????????????????????????????????????????????",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      dummySpaceBoxVer(25),
                      const Text(
                        "????????????????????????????????????????????????",
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
                        "?????????????????????????????????????????????????????????????????????????????????????????????\n???????????????????????????",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "????????????????????????????????????????????????????????????????????????????????????",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(15),
                      const Text(
                        "????????????????????????????????????????????????????????????????????????????????????????????????",
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
                        "????????????????????????????????????????????????????????????,\n??? ?????????????????????????????????????????????????????????????????????????????????",
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
                                "???????????????????????????  ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            """    ???????????????????????????????????????  """,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                ),
                          ),
                          CheckBoxCustom(inviteRuleVerifedFn),
                          const Text(
                            """  ???????????????""",
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
                  text: "???????????????????????????",
                  onClick: () {
                    if (!inviteRuleVerifed) {
                      setState(() {
                        warningMsg = "??????????????????????????????????????????????????????????????????";
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
