import 'package:flutter/material.dart';
import 'package:online_shop/_constants.dart';
import 'package:online_shop/pages/homepage.dart';
import 'package:online_shop/_routers.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});

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
          child: currentWidth < 870 ? const SmallScreen() : const BigScreen(),
        ),
      ],
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
