import 'package:flutter/material.dart';
import 'package:online_shop/pages/homepage.dart';
import 'package:online_shop/_routers.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});
  final double fsize = 15;
  List<String> pageNemas = [
    "TOP",
    "E-MON MARKETについて",
    "お知らせ",
    "会員登録",
    "会員ログイン",
    "お問い合わせ"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 80,
          width: double.infinity,
          color: Color.fromARGB(255, 248, 132, 171),
          child: CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: const Text('LOGO'),
          ),
        ),
        Container(
          color: Color.fromARGB(221, 12, 12, 12),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: pageNemas
                .map(
                  (item) => TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: fsize),
                      padding: const EdgeInsets.only(right: 30, left: 30),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.homePage);
                    },
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
