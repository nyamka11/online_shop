import 'package:flutter/material.dart';
import 'package:online_shop/_routers.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_header.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_process.dart';

class ShopingCartFinished extends StatelessWidget {
  const ShopingCartFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      padding: 20,
      bgColor: Colors.white,
      body: Column(
        children: [
          const Header(),
          const SizedBox(height: 20),
          ProcessList(stepIndex: 3),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "ご利用ありがとうござい",
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Emon Marketへの注文を承りりました",
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text("「ｘｘｘｘｘｘｘｘｘｘｘｘ＠ｘｘｘｘｘｘｘｘ」 宛てに、注文内容控えを送信しました。"),
                  const Text("記載内容をご確認のうえ、商品到着まで申し込み控えとして"),
                  const Text("大事に保管してください。"),
                  const SizedBox(height: 20),
                  const Text("今後とも Emon Market をよろしくお願い申し上げます。"),
                  const SizedBox(height: 20),
                  Text(
                    "※注文控えメールが届かない場合は、ご入力いただいたメールアドレスが",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "間違ている可能性がございます。",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "数分経っても届かない場合は",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "お問い合わせ】 ページからお問い合わせください。",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    padding: const EdgeInsets.all(20),
                    color: Colors.amber[100],
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "招待対象商品が指定されています。",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "続けて、お友達の招待指定をしてください。",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "ここで指定をしないと、招待ができなくなります。",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed(Routes.homePage),
                          child: const Text(
                            "※招待に関しては　会員利用規約 参照してください。",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {/* ボタンがタップされた時の処理 */},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey, //ボタンの背景色
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 10,
                            ),
                            child: Text(
                              'お友達を招待する',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
