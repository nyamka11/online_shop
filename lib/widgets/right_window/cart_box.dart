import 'package:flutter/material.dart';

class CartBox extends StatelessWidget {
  const CartBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 99, 98, 98),
          ),
          child: const Text(
            "カート",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              right: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
              bottom: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text("現在のポイント"),
              const Text("xxxxxxxxxx"),
              const SizedBox(height: 10),
              const Text("yyyy/mm/dd 失効予定ポイント"),
              const Text("xxxxxxxxxx"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {/* ボタンが押せる時 */},
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 114, 113, 113),
                ),
                child: const Text('マイページ'),
              ),
              const SizedBox(height: 20),
              const InkWell(
                child: Text(
                  'ログアウト',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
