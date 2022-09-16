import 'package:flutter/material.dart';

class InputInvitationInfo extends StatelessWidget {
  const InputInvitationInfo({
    Key? key,
    required this.rowNo,
    required this.readOnly,
    required this.inputNameController,
    required this.inputEmailController,
  }) : super(key: key);

  final int rowNo;
  final bool readOnly;
  final TextEditingController inputNameController;
  final TextEditingController inputEmailController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 20,
            maxHeight: 20,
            minWidth: 40,
            maxWidth: 40,
          ),
          // color: Color.fromARGB(255, 255, 178, 114),
          decoration: const BoxDecoration(
            // color: const Color.fromARGB(255, 255, 209, 171),
            border: Border(
              // top: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Text(
            rowNo.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              height: 1.35,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minHeight: 20,
            maxHeight: 20,
            minWidth: 230,
            maxWidth: 230,
          ),
          // color: Color.fromARGB(255, 255, 178, 114),
          decoration: const BoxDecoration(
            // color: Color.fromARGB(255, 255, 209, 171),
            border: Border(
              // top: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              controller: inputNameController,
              keyboardType: TextInputType.text,
              readOnly: readOnly,
              // cursorHeight: 12,
              style: const TextStyle(
                height: 1.2,
                // fontWeight: FontWeight.bold,
                // fontSize: 12,
              ),
              // cursorHeight: 1,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                  // bottom: 5,
                  top: 5,
                  left: 5,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minHeight: 20,
            maxHeight: 20,
            minWidth: 230,
            maxWidth: 230,
          ),
          // color: Color.fromARGB(255, 255, 178, 114),
          decoration: const BoxDecoration(
            // color: Color.fromARGB(255, 255, 209, 171),
            border: Border(
              // top: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              controller: inputEmailController,
              keyboardType: TextInputType.emailAddress,
              readOnly: readOnly,
              // cursorHeight: 12,
              style: const TextStyle(
                height: 1.2,
                // fontWeight: FontWeight.bold,
                // fontSize: 12,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                  // bottom: 5,
                  top: 5,
                  left: 5,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
