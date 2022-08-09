import 'package:flutter/material.dart';
import 'package:online_shop/_constants.dart';
import 'package:online_shop/_routers.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color.fromARGB(255, 218, 247, 221),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       // color: Colors.red,
              //       height: 100,
              //       width: 500,
              //     ),
              //     Positioned(
              //       left: 10,
              //       child: Container(
              //         height: 100,
              //         width: 120,
              //         child: Image.asset(
              //             "/images/header/tree-g6de875e39_1280.png"),
              //       ),
              //     ),
              //     Positioned(
              //       left: 100,
              //       child: Container(
              //         height: 115,
              //         width: 200,
              //         child: Image.asset(
              //             "/images/header/flower-g26ed6245e_1920-1.png"),
              //       ),
              //     ),
              //     Positioned(
              //       left: 265,
              //       child: Container(
              //         height: 105,
              //         width: 200,
              //         child: Image.asset("/images/header/title1_03.png"),
              //       ),
              //     )
              //   ],
              // ),
              Container(
                height: 100,
                width: 120,
                child: Image.asset("/images/header/logo.png"),
              ),
              // Stack(
              //   children: [
              //     Container(
              //       // color: Colors.red,
              //       height: 100,
              //       width: 500,
              //     ),
              //     Positioned(
              //       right: 10,
              //       child: Container(
              //         height: 110,
              //         width: 140,
              //         child: Image.asset("/images/header/title1_01.png"),
              //       ),
              //     ),
              //     Positioned(
              //       right: 160,
              //       child: Container(
              //         height: 110,
              //         width: 140,
              //         child: Image.asset("/images/header/title1_02.png"),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          Container(
            color: Color.fromARGB(221, 12, 12, 12),
            height: 50,
            child: currentWidth < 870 ? const SmallScreen() : const BigScreen(),
          ),
        ],
      ),
    );
  }
}

class DrawarCustom extends StatelessWidget {
  const DrawarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ListView(
          children: [
            ...Common.pageNemas
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: OutlinedButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: Common.navbarFontSize),
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        backgroundColor: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.homePage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          item,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
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
  const BigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: Common.pageNemas
          .map(
            (item) => TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: Common.navbarFontSize),
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
