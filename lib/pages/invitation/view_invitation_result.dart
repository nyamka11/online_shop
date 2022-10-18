import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../widgets/_common/layout_template.dart';

class InvitationResultPage extends StatefulWidget {
  const InvitationResultPage({super.key});

  @override
  State<InvitationResultPage> createState() => _InvitationResultPageState();
}

class _InvitationResultPageState extends State<InvitationResultPage> {
  TextEditingController msgController = TextEditingController();
  List<TextEditingController> inputNameController = [];
  List<TextEditingController> inputEmailController = [];

  String storageLoginId = "loggedUserName";
  String? loggedUserName;

  @override
  void initState() {
    getSessionData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getSessionData() async {
    var tmpLoggedUserName = await SessionManager().get("loggedUserName");
    setState(() {
      loggedUserName = tmpLoggedUserName;
    });
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

    msgController = arguments['msgController'] as TextEditingController;
    inputNameController =
        arguments['inputNameController'] as List<TextEditingController>;
    inputEmailController =
        arguments['inputEmailController'] as List<TextEditingController>;

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
                    "${"$loggedUserName".padRight(38)}さん。      お友達招待が完了いたしました。",
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
                          fontSize: 12,
                        ),
                      ),
                      dummySpaceBoxVer(10),
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
                          readOnly: true,
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
                        """
※会員登録内容のメールアドレスへ、招待に必要な情報を送付しました。
必ず保管しておいてください。
お友達招待メールの内容控は、注文控で指定した連絡先アドレスではなく、
会員登録のメールアドレスに送られますので、お間違いのないようにお願いします。""",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                dummySpaceBoxVer(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
