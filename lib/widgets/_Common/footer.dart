import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../_constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(221, 31, 31, 31),
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "会社名: XXXXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "住所: XXXXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "電話番号: XXXXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Fax番号: XXXXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "お問い合わせ対応時間: XXXXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  child: Image.asset("/images/header/logo.png"),
                ),
                Row(
                  children: [
                    // Icon(Icons.facebook),
                    // FaIcon(FontAwesomeIcons.twitter),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...Common.pageNemas.map(
                  (e) => Row(
                    children: [
                      Container(
                        height: 15,
                        width: 2,
                        color: Colors.amber,
                        margin: EdgeInsets.all(15),
                      ),
                      Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                  width: 2,
                  color: Colors.amber,
                  margin: EdgeInsets.all(15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
