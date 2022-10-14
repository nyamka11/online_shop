import 'package:flutter/material.dart';

import '../../models/dialog_types.dart';

class MyAlertDialog extends StatelessWidget {
  MyAlertDialog({
    this.height,
    this.cancelBtn = false,
    required this.type,
    required this.textBody,
  });

  final double? height;
  final String? textBody;
  final DialogTypes type;
  final bool cancelBtn;

  Widget dialogSwitchBody() {
    switch (type) {
      case DialogTypes.loading:
        return Column(
          children: const [
            SizedBox(height: 20),
            CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 193, 224, 247),
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            Text("読み込み中..."),
          ],
        );
      case DialogTypes.error:
        return Container(
          margin: const EdgeInsets.only(top: 5),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 40.0,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(textBody!),
              ),
            ],
          ),
        );
      case DialogTypes.success:
        return Container(
          margin: const EdgeInsets.only(top: 5),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 40.0,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(textBody!),
              ),
            ],
          ),
        );
      case DialogTypes.warning:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_rounded,
              color: Colors.orange,
              size: 40.0,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(textBody!),
            ),
          ],
        );
      case DialogTypes.simple:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.grey,
              size: 40.0,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(textBody!),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: height ?? 80,
        child: Center(
          child: Column(
            children: [
              dialogSwitchBody(),
            ],
          ),
        ),
      ),
      actions: [
        if (cancelBtn)
          Container(
            margin: const EdgeInsets.only(bottom: 7, right: 7),
            child: TextButton(
              onPressed: () => Navigator.pop(context, false), // passing false
              child: const Text('キャンセル'),
            ),
          ),
      ],
    );
  }
}
