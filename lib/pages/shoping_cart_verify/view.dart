import 'package:flutter/material.dart';
import 'package:online_shop/data/shoping_cart_data.dart';
import 'package:online_shop/widgets/check_box_custom.dart';
import 'package:provider/provider.dart';
import '../../_routers.dart';
import '../../provider/shoping_cart_provider.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/product_list_row.dart';
import '../../widgets/shoping_cart_pages_process.dart';
import '../../widgets/shoping_cart_pages_header.dart';

class ShopingCartVerify extends StatefulWidget {
  const ShopingCartVerify({super.key});

  @override
  State<ShopingCartVerify> createState() => _ShopingCartVerifyState();
}

class _ShopingCartVerifyState extends State<ShopingCartVerify> {
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
              Navigator.of(context).pushNamed(Routes.shopingCartPage);
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
      const ActionsWidget(),
      const SizedBox(height: 100),
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

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({super.key});

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  bool paymentIsVerifed = false;
  bool serviceIsVerifed = false;
  bool isErrorText = false;

  void paymentIsVerifedFn(bool value) {
    setState(() {
      paymentIsVerifed = value;
    });
  }

  void serviceIsVerifedFn(bool value) {
    setState(() {
      serviceIsVerifed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "御支払規約",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 100),
            Row(
              children: [
                const Text("御支払規約に同意する"),
                CheckBoxCustom(paymentIsVerifedFn),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "利用規約",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 100),
            Row(
              children: [
                const Text("利用規約に同意する"),
                CheckBoxCustom(serviceIsVerifedFn),
              ],
            )
          ],
        ),
        if (isErrorText)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "「規約の同意してお支払いに進む」をクリックすると、エシカルマーケットのページを離れて、クレジット御支払代行会社のページに移動します。確認の上、ボタンを押してください。",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.productListPage);
              },
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
              onPressed: () {
                if (!paymentIsVerifed || !serviceIsVerifed) {
                  setState(() {
                    isErrorText = true;
                  });
                } else {
                  setState(() {
                    isErrorText = false;
                  });

                  Navigator.of(context).pushNamed(Routes.shopingCartPayment);
                }
              },
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
        ),
      ],
    );
  }
}