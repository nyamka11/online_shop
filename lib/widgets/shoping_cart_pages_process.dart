import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';

import '../_routers.dart';

class ProcessList extends StatelessWidget {
  final int stepIndex;

  ProcessList({
    Key? key,
    required this.stepIndex,
  }) : super(key: key);

  final List<String> steps = ["カートの中の確認 >>", "注文確定 >>", " お支払い >>", " 終了 "];

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
                    padding: const EdgeInsets.only(
                      top: 14,
                      bottom: 8,
                      left: 20,
                      right: 20,
                    ),
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
                      horizontal: 12,
                      vertical: 6,
                    ),
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
