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
    var currentWidth = MediaQuery.of(context).size.width;

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
          child: currentWidth < 870
              ? SmallScreen(pageNemas: pageNemas, fsize: fsize)
              : BigScreen(pageNemas: pageNemas, fsize: fsize),
        ),
      ],
    );
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({
    Key? key,
    required this.pageNemas,
    required this.fsize,
  }) : super(key: key);

  final List<String> pageNemas;
  final double fsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            print("aa");
            Scaffold.of(context).openEndDrawer();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 25),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}

class BigScreen extends StatelessWidget {
  const BigScreen({
    Key? key,
    required this.pageNemas,
    required this.fsize,
  }) : super(key: key);

  final List<String> pageNemas;
  final double fsize;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
