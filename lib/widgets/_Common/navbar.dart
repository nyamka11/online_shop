import 'package:flutter/material.dart';
import 'package:online_shop/_constants.dart';
import 'package:online_shop/_routers.dart';
import 'package:provider/provider.dart';

import '../../provider/shoping_cart_provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 218, 247, 221),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 120,
                child: Image.asset("/images/header/logo.png"),
              ),
            ],
          ),
          Container(
            color: const Color.fromARGB(221, 12, 12, 12),
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
    final shopingCard = Provider.of<ShopingCartProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...Common.pageNemas
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
        // InkWell(
        //   onTap: () {
        //     Navigator.of(context).pushNamed(Routes.shopingCartPage);
        //   },
        //   child: Stack(
        //     children: [
        //       Container(
        //         height: 100,
        //         width: 70,
        //         color: Colors.white,
        //         child: const IconButton(
        //           onPressed: null,
        //           icon: Icon(
        //             Icons.shopping_cart,
        //             color: Color.fromARGB(255, 126, 44, 71),
        //             size: 30,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         right: 0,
        //         child: Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(50),
        //             color: Colors.red,
        //           ),
        //           child: Text(
        //             shopingCard.count.toString(),
        //             style: const TextStyle(
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        SizedBox(width: 30)
      ],
    );
  }
}
