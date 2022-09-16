import 'package:flutter/material.dart';

class PriceBox extends StatelessWidget {
  final double totalPrice;
  const PriceBox(this.totalPrice, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 199, 199, 199)),
          color: Colors.white),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  "商品会計（税抜き）会計",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "$totalPrice￥",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text("税率 ９９％ 会計")),
                Expanded(flex: 1, child: Text("9,999,999¥")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text("税率 ９９％ 会計")),
                Expanded(flex: 1, child: Text("9,999,999¥")),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(flex: 1, child: Text("その他")),
              Expanded(flex: 1, child: Text("")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text("税率 ９９％ 会計")),
                Expanded(flex: 1, child: Text("9,999,999¥")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text("税率 ９９％ 会計")),
                Expanded(flex: 1, child: Text("9,999,999¥")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text("税率 ９９％ 会計")),
                Expanded(flex: 1, child: Text("9,999,999¥")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
