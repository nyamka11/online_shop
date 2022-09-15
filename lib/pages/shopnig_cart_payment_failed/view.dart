import 'package:flutter/material.dart';
import '../../widgets/shoping_cart_pages_process.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/shoping_cart_pages_header.dart';

class ShopingCartFailed extends StatelessWidget {
  const ShopingCartFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      padding: 20,
      bgColor: Color.fromARGB(255, 250, 250, 250),
      body: Column(
        children: [
          const Header(),
          const SizedBox(height: 20),
          ProcessList(stepIndex: 2),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "お支払い手続きで問題が発生しました。",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "注文が完了していない可能性があります。",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "エラー内容",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  errorMsg2(),
                  const SizedBox(height: 250),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorMsg1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "◆「お客様が指定されたクレジット情報に問題があります」 と表示されている場合。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "お手持ちのクレジットの番号の入力内容やカード期限などをご確認ください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "注文は完了しておりません。 注文をやり直してください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget errorMsg2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "◆「タイムアウトになりました。」",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "「規約に同意して御支払に進む」ボタンを押すまでに１０分以上経過したり",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "お使いのネット環境により通信速度が遅いためタイムアウトになった可能性があります。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "注文は完了しておりません。 注文をやり直してください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget errorMsg3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "◆上記以外",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "「お問い合わせ」ページからお問い合わせください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "お問い合わせの際は、このが目で表示しているエラー内容を",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "画面のスクリーンショットを取ったり、書き留めるなどしてお伝えください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
