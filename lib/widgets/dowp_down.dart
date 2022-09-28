import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    final List<String> list = ['One', 'Two', 'Free', 'Four'];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(left: 8, right: 8),
      width: 200,
      height: 35,
      child: DropdownButton(
        underline: const SizedBox(),
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
    );
  }
}
