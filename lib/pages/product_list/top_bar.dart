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
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 15,
          ),
          child: const Text(
            "以下の高品は、正会員の登録をすると購入できます。",
            style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Container(
          // margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  "カテゴリ",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Text(
                  "条件 : ",
                  style: TextStyle(fontSize: 16),
                ),
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
                const Text(
                  "バッチ : ",
                  style: TextStyle(fontSize: 16),
                ),
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
