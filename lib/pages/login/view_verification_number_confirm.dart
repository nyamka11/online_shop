// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/_common/http_helper.dart';
import '../../widgets/input_controls/verify_number_input.dart';

class VerificationNumberConfirmPage extends StatefulWidget {
  final String param1;
  const VerificationNumberConfirmPage({super.key, required this.param1});

  @override
  State<VerificationNumberConfirmPage> createState() =>
      _VerificationNumberConfirmPageState();
}

class _VerificationNumberConfirmPageState
    extends State<VerificationNumberConfirmPage> {
  List<TextEditingController> inputController = [];
  String warningMsg = "";

  @override
  void initState() {
    inputController.clear();
    for (int i = 0; i < 6; i++) {
      inputController.add(TextEditingController());
    }
    warningMsg = "";
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 6; i++) {
      inputController[i].dispose();
    }
    inputController.clear();
    warningMsg = "";
    super.dispose();
  }

  void checkValidNumber() async {
    String inputNumber = "";
    for (var e in inputController) {
      if (e.text.isEmpty) break;
      inputNumber = inputNumber + e.text.trim();
    }

    if (inputNumber.length == 6) {
      Map<String, dynamic> body = {
        "mailAdd": widget.param1,
        "tempCode": inputNumber,
      };

      Map res = await HTTPHelper().post("/login/checkTempCode", body);

      if (res["success"] == false) {
        setState(() {
          warningMsg = res["message"];
        });
        return;
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(
          context,
          Routes.changePasswordPage,
          arguments: {
            "email": widget.param1,
          },
        );
      }
    }
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
                    "HOME ????????????????????????",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                dummySpaceBoxVer(15),
                const Text(
                  "???????????????????????????????????????????????????????????????????????????????????????\n????????????????????????????????? ????????????????????????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(15),
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
                if (warningMsg != "") dummySpaceBoxVer(15),
                if (warningMsg != "")
                  Text(
                    warningMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                dummySpaceBoxVer(45),
                const Text(
                  "???????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(10),
                const Text(
                  """
????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????????????????""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
                dummySpaceBoxVer(30),
                const Text(
                  """
?????????????????????????????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                dummySpaceBoxVer(30),
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
                      "??? ??????????????????????????????",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
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
