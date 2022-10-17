import 'package:flutter/material.dart';

import '../../models/dialog_types.dart';
import 'navigator_key.dart';
import 'alert_dialog.dart';

class GlobaAlertDialog {
  static pop() {
    navigatorKey.currentState?.pop();
  }

  static popUntil(String routeName) {
    navigatorKey.currentState?.popUntil((route) {
      return route.settings.name == routeName;
    });
  }

  static showLoadingDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (_) {
        return MyAlertDialog(
          height: 100,
          type: DialogTypes.loading,
          textBody: "読み込み中....",
        );
      },
    );
  }

  static showErrorDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (_) {
        return MyAlertDialog(
          height: 80,
          type: DialogTypes.error,
          textBody: "システムエラーが発生しました。管理者に連絡してください",
          cancelBtn: true,
        );
      },
    );
  }

  static showAlertDialog(String text) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
