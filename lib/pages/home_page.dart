import 'package:flutter/material.dart';
import 'package:online_shop/_constants.dart';
import '../widgets/_common/layout_template.dart';
import '../widgets/category_boxs/view.dart';
import '../widgets/recommend_products_boxs/view.dart';
import '../widgets/link.dart';
import '../widgets/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String textStr =
      "TEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXTTEXT";

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      bgColor: const Color(0xFFecf6fa),
      body: Column(
        children: [
          SlideBar(),
          const SizedBox(height: Common.lineHeightSpacer),
          const BoxView(),
          const SizedBox(height: Common.lineHeightSpacer),
          CategoriesView(),
          const SizedBox(height: Common.lineHeightSpacer),
          const Text("お式し会員登録して　SDGS生活を始めよう！"),
          const SizedBox(height: Common.lineHeightSpacer),
          Container(
            width: double.infinity,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                const Text("今月のお勧め商品をお式し入でできます。"),
                const SizedBox(height: Common.lineHeightSpacer),
                ElevatedButton(
                  onPressed: () {/* ボタンがタップされた時の処理 */},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 80,
                      left: 80,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Text(
                      'お式し会員登録',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Common.lineHeightSpacer),
                const Text("正会員も、お式し会員も　会員　登録は無理です。"),
              ]),
            ),
          ),
          const SizedBox(height: Common.lineHeightSpacer),
          const LinkBtn(),
          const SizedBox(height: Common.lineHeightSpacer),
          Card(
            elevation: 10,
            child: Image.asset('images/banner.PNG'),
          ),
          const SizedBox(height: Common.lineHeightSpacer),
          TextBanner(textStr: textStr),
          TextBanner(textStr: textStr),
          Card(
            elevation: 10,
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Container(
              color: Color.fromARGB(255, 245, 166, 146),
              margin: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 100,
              child: const Text(
                'Card',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                const Text("今月のお勧め商品をお式し入でできます。"),
                const SizedBox(height: Common.lineHeightSpacer),
                ElevatedButton(
                  onPressed: () {/* ボタンがタップされた時の処理 */},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 80,
                      left: 80,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Text(
                      'お式し会員登録',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: Common.lineHeightSpacer),
                const Text("正会員も、お式し会員も　会員　登録は無理です。"),
              ]),
            ),
          ),
          Card(
            elevation: 10,
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Container(
              color: Color.fromARGB(255, 165, 207, 255),
              margin: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 200,
              child: const Text(
                'Card',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextBanner extends StatelessWidget {
  const TextBanner({
    Key? key,
    required this.textStr,
  }) : super(key: key);

  final String textStr;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(textStr),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(textStr),
          ),
        ),
      ),
    ]);
  }
}
