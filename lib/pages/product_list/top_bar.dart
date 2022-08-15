import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    final List<String> list = ['One', 'Two', 'Free', 'Four'];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text("以下の高品は、正会員の登録をすると購入できます。"),
        ),
        Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(6),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Text("カテゴリ"),
                const SizedBox(width: 20),
                const Text("条件 : "),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: 200,
                  height: 35,
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: dropdownValue,
                    items: list
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(width: 20),
                const Text("バッチ : "),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: 200,
                  height: 35,
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: dropdownValue,
                    items: list
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
