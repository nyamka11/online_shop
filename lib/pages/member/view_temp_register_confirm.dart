// ignore_for_file: avoid_web_libraries_in_flutter
// ignore: depend_on_referenced_packages
import 'dart:html' as html;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_common/http_helper.dart';
import '../../widgets/buttons/my_button.dart';
import '../../widgets/input_controls/my_text_field.dart';
import '../../_routers.dart';
import '../../widgets/_common/layout_template.dart';

import '../../widgets/input_controls/verify_number_input.dart';

class TempRegisterConfirmPage extends StatefulWidget {
  const TempRegisterConfirmPage({super.key});

  @override
  State<TempRegisterConfirmPage> createState() =>
      _TempRegisterConfirmPageState();
}

class _TempRegisterConfirmPageState extends State<TempRegisterConfirmPage> {
  List<TextEditingController> inputController = [];
  final loginIdController = TextEditingController();
  String warningMsg = "";

  @override
  void initState() {
    warningMsg = "";
    inputController.clear();
    for (int i = 0; i < 6; i++) {
      inputController.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    warningMsg = "";
    loginIdController.dispose();
    for (int i = 0; i < 6; i++) {
      inputController[i].dispose();
    }
    inputController.clear();
    super.dispose();
  }

  void checkValidNumber() {
    String inputNumber = "";
    for (var e in inputController) {
      if (e.text.isEmpty) break;
      inputNumber = inputNumber + e.text.trim();
    }
    // if (inputNumber == "123456") {
    //   print("OKKK");
    //   Navigator.pushNamed(
    //     context,
    //     Routes.changePasswordPage,
    //   );
    // } else if (inputNumber.length == 6) {
    //   print("Message haruulnaa");
    // }
  }

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
                    "HOME ???????????????????????? ???????????????",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(15),
                const Text(
                  "?????????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(65),
                const Text(
                  "???????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(5),
                const Text(
                  "???????????????????????????????????????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(5),
                const Text(
                  "?????? ?????????????????????????????????????????????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                dummySpaceBoxVer(15),
                SizedBox(
                  width: 580,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          """????????????ID???????????????????????????""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MyTextField(
                        height: 40,
                        width: 350,
                        controller: loginIdController,
                        hintText: "?????????????????????",
                      ),
                    ],
                  ),
                ),
                dummySpaceBoxVer(30),
                const Text(
                  "???????????????????????? ???????????????????????????????????????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                dummySpaceBoxVer(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VerifyNumberInput(
                      controller: inputController[0],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[1],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[2],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[3],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[4],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                    dummySpaceBoxHor(13),
                    VerifyNumberInput(
                      controller: inputController[5],
                      checkValidNumberCallBack: checkValidNumber,
                    ),
                  ],
                ),
                dummySpaceBoxVer(30),
                // if (warningMsg != "") dummySpaceBoxVer(15),
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                dummySpaceBoxVer(45),
                MyButton(
                  h: 40,
                  w: 300,
                  color: Colors.blue,
                  text: "???????????????????????????",
                  onClick: () async {
                    if (loginIdController.text.isEmpty) {
                      setState(() {
                        warningMsg = "???????????????????????????????????????????????????";
                      });
                      return;
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(loginIdController.text)) {
                      setState(() {
                        warningMsg = "????????????????????????????????????????????????????????????\n??????????????????????????????????????????????????????";
                      });
                      return;
                    }
                    String inputNumber = "";
                    for (var e in inputController) {
                      if (e.text.isEmpty) break;
                      inputNumber = inputNumber + e.text.trim();
                    }

                    Map<String, dynamic> data = {
                      "mailAdd": loginIdController.text,
                      "tmpCode": inputNumber,
                    };

                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String encodedParam1 =
                        stringToBase64.encode(loginIdController.text);
                    // String decoded = stringToBase64.decode(encoded);

                    Map<String, dynamic> body = {
                      "url":
                          "${Uri.base.origin}${Routes.memberRegisterPage}?param1=$encodedParam1",
                      "data": jsonEncode(data).toString(),
                    };

                    Map res = await HTTPHelper()
                        .post("/mAccountTemp/confirmRegister", body);

                    print(res["success"]);
                    if (res["success"] == false) {
                      print(res["message"]);
                      setState(() {
                        warningMsg = "????????????????????? ????????? ??????????????????????????????";
                        // warningMsg = resObj["message"];
                      });
                      return;
                    } else {
                      Map<String, String> queryParams = {
                        "param1": encodedParam1
                      };

                      // ignore: use_build_context_synchronously
                      // Navigator.pushNamed(
                      //   context,
                      //   Uri(
                      //           path: Routes.memberRegisterPage,
                      //           queryParameters: queryParams)
                      //       .toString(),
                      // );

                      var url = Uri.base.origin +
                          Uri(
                                  path: Routes.memberRegisterPage,
                                  queryParameters: queryParams)
                              .toString();

                      html.window.open(url, "_self");
                    }
                    // if (sendEmail(
                    //         loginIdController.text, "Test", "Test Email") ==
                    //     false) return;
                    // Navigator.pushNamed(
                    //   context,
                    //   Routes.tempRegisteredPage,
                    // );
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

// Future<bool> sendEmail(String email, String subject, String text) async {
//   final uri = Uri.parse('http://localhost:6060/email/sendEmail');
//   final headers = {'Content-Type': 'charset=UTF-8'};
//   Map<String, String> body = {
//     'to': email,
//     'cc_to': email,
//     'subject': subject,
//     'body': text
//   };
//   // String jsonBody = json.encode(body);
//   // final encoding = Encoding.getByName('utf-8');

//   http.Response response = await http.post(
//     uri,
//     // headers: headers,
//     headers: {},
//     body: body,
//     // encoding: encoding,
//   );
//   print(response.statusCode);
//   print(response.body);
//   if (response.statusCode != 200) {
//     return true;
//   } else {
//     return false;
//   }
// }

// Future<String> apiRequest(String url, Map jsonMap) async {
//   HttpClient httpClient = new HttpClient();
//   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//   request.headers.set('content-type', 'application/json');
//   request.add(utf8.encode(json.encode(jsonMap)));
//   HttpClientResponse response = await request.close();
//   // todo - you should check the response.statusCode
//   String reply = await response.transform(utf8.decoder).join();
//   httpClient.close();
//   return reply;
// }