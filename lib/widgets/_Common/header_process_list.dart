import 'package:flutter/material.dart';

class ProcessList extends StatelessWidget {
  final int stepIndex;

  ProcessList({
    Key? key,
    required this.stepIndex,
  }) : super(key: key);

  final List<String> steps = ["カートの中の確認 >>", "注文確定 >>", "お支払い >>", "終了"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps.map((item) {
        int index = steps.indexOf(item);
        return Row(
          children: [
            stepIndex >= index
                ? Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black26)),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
            steps.length != index + 1
                ? Container(
                    width: 50,
                    height: 1,
                    color: Colors.grey,
                  )
                : Container(),
          ],
        );
      }).toList(),
    );
  }
}
