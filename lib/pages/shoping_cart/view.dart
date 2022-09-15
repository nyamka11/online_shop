import 'package:flutter/material.dart';
import 'package:online_shop/data/shoping_cart_data.dart';
import 'package:provider/provider.dart';
import '../../_routers.dart';
import '../../provider/shoping_cart_provider.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/product_list_row_shoping_cart.dart';
import '../../widgets/shoping_cart_pages_process.dart';
import '../../widgets/shoping_cart_pages_header.dart';
import '../../widgets/shoping_cart_price_box.dart';

class ShopingCartPage extends StatelessWidget {
  const ShopingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shopingCart = Provider.of<ShopingCartProvider>(context);

    double totalPrice = 0;
    for (var item in shopingCartListItems) {
      totalPrice += item.quantity * item.product.total;
    }

    return MainLayoutTemplate(
      bgColor: const Color.fromARGB(255, 250, 250, 250),
      padding: 20,
      body: shopingCart.count == 0
          ? emptyContentBody(context)
          : Column(
              children: [
                contentBody(shopingCart, context),
                const SizedBox(height: 20),
                PriceBox(totalPrice),
                const SizedBox(height: 50),
                footerButtons(context),
                const SizedBox(height: 50),
              ],
            ),
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
      ProcessList(stepIndex: 0),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Text(
          "カートの中身 (${shopingCart.count})",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // color: Colors.black12,
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
                  return ListRowShopingCart(shopingCartListItems[index]);
                },
                itemCount: shopingCartListItems.length,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget footerButtons(context) {
  return Row(
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
          Navigator.of(context).pushNamed(Routes.shopingCartVerify);
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
          // '規約に同意して御支払に進む',
          '注文の確定に進む',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      )
    ],
  );
}
