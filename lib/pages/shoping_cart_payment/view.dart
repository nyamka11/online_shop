import 'package:flutter/material.dart';
import 'package:online_shop/data/shoping_cart_data.dart';
import 'package:online_shop/widgets/check_box_custom.dart';
import 'package:provider/provider.dart';
import '../../provider/shoping_cart_provider.dart';
import '../../widgets/_common/layout_template.dart';
import 'header.dart';
import '../../widgets/_common/header_process_list.dart';
import 'row_item.dart';

class ShopingCartPayment extends StatefulWidget {
  const ShopingCartPayment({super.key});

  @override
  State<ShopingCartPayment> createState() => _ShopingCartPaymentState();
}

class _ShopingCartPaymentState extends State<ShopingCartPayment> {
  @override
  Widget build(BuildContext context) {
    final shopingCart = Provider.of<ShopingCartProvider>(context);
    return MainLayoutTemplate(
      bgColor: Color.fromARGB(255, 250, 250, 250),
      padding: 20,
      body: shopingCart.count == 0
          ? emptyContentBody(context)
          : contentBody(shopingCart, context),
    );
  }
}

Widget emptyContentBody(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height - 350,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Empty cart",
          style: TextStyle(fontSize: 20),
        ),
        Icon(
          Icons.shopping_cart,
          size: 50,
        )
      ],
    ),
  );
}

Widget contentBody(shopingCart, context) {
  return Column(
    children: [
      const Header(),
      const SizedBox(height: 20),
      ProcessList(stepIndex: 1),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "カートの中身 (${shopingCart.count})",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // color: Colors.black12,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 25,
              ),
            ),
            child: const Text(
              '前の画面に戻る',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListRows(
                    index: index,
                    ctx: context,
                  );
                },
                itemCount: shopingCartList.length,
              ),
            ),
          ),
        ],
      ),
      totalPriceBox(),
      const SizedBox(height: 20),
      anwserBox(),
      const SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: const Text(
          "「規約の同意してお支払いに進む」をクリックすると、エシカルマーケットのページを離れて、クレジット御支払代行会社のページに移動します。確認の上、ボタンを押してください。",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 20),
      footerButtons(),
      const SizedBox(height: 200),
    ],
  );
}

Widget totalPriceBox() {
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
          children: const [
            Expanded(
              flex: 1,
              child: Text(
                "商品会計（税抜き）会計",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(flex: 1, child: Text("9,999,999¥")),
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

Widget anwserBox() {
  return Container(
    width: 600,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "御支払規約",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: const [
                  Text("御支払規約に同意する"),
                  CheckBoxCustom(),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "利用規約",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: const [
                  Text("利用規約に同意する"),
                  CheckBoxCustom(),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget footerButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 16,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 100,
          ),
        ),
        child: const Text(
          '他の商品を頼む',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.pink[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 16,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 100,
          ),
        ),
        child: const Text(
          '規約に同意して御支払に進む',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      )
    ],
  );
}
