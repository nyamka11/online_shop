import 'package:flutter/material.dart';
import 'package:online_shop/data/shoping_cart_data.dart';
import 'package:online_shop/widgets/check_box_custom.dart';
import 'package:provider/provider.dart';
import '../../_routers.dart';
import '../../provider/shoping_cart_provider.dart';
import '../../widgets/_common/layout_template.dart';
import '../../widgets/product_list_row/product_list_row_shoping_cart.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_header.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_pages_process.dart';
import '../../widgets/shoping_cart_widgets/shoping_cart_price_box.dart';

class ShopingCartVerify extends StatefulWidget {
  const ShopingCartVerify({super.key});

  @override
  State<ShopingCartVerify> createState() => _ShopingCartVerifyState();
}

class _ShopingCartVerifyState extends State<ShopingCartVerify> {
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    for (var item in shopingCartListItems) {
      totalPrice += item.quantity * item.product.total;
    }

    final shopingCart = Provider.of<ShopingCartProvider>(context);
    return MainLayoutTemplate(
      bgColor: const Color.fromARGB(255, 250, 250, 250),
      padding: 20,
      body: shopingCart.count == 0
          ? emptyContentBody(context)
          : Column(
              children: [
                contentBody(shopingCart, context),
                PriceBox(totalPrice),
                const SizedBox(height: 20),
                const ActionsWidget(),
                const SizedBox(height: 100),
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
      ProcessList(stepIndex: 1),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "?????????????????? (${shopingCart.count})",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              '?????????????????????',
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

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({super.key});

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  bool paymentIsVerifed = false;
  bool serviceIsVerifed = false;
  bool isErrorText = false;
  bool mailSameCheck = false;

  final postNumber = TextEditingController();
  final emailController = TextEditingController();
  final remailController = TextEditingController();
  final addressController1 = TextEditingController();
  final addressController2 = TextEditingController();
  final addressController3 = TextEditingController();
  final commentController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    remailController.dispose();
    super.dispose();
  }

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
    if (emailController == remailController) {
      mailSameCheck = false;
    }

    return Column(
      children: [
        SizedBox(
          width: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "?????????????????? ???????????????",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(width: 20),
                          Text(
                            "?????????????????????????????????????????????????????????\n"
                            "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n"
                            "???????????????????????????????????????????????????????????????????????????\n"
                            "??????????????????????????????????????????????????????????????????????????????\n"
                            "????????????????????????????????? ???????????????????????????????????????????????????",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Text(
                            "???????????????",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(width: 20),
                          Text("????????????"),
                          SizedBox(width: 20),
                          Text(
                            "URTNASAN NYAMGEREL",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(width: 20),
                          Text("????????????:"),
                          SizedBox(width: 20),
                          Text(
                            "?????????????????????????????????",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          SizedBox(width: 20),
                          Text("???????????????????????????"),
                          SizedBox(width: 20),
                          Text(
                            "425-0085",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "????????????????????????278-2?????????????????????302",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            "???????????????",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(width: 20),
                          Text(
                            "????????????????????????????????????????????????????????????????????????????????????????????????\n"
                            "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n"
                            "???????????????????????????????????????????????????????????????????????????????????????????????????????????????",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text("???????????????"),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text("????????????????????????"),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text("??????????????????????????????"),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: remailController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Text(
                            "???????????????",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "???????????????????????????????????????????????????????????????????????????",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text("????????????"),
                          const SizedBox(width: 20),
                          const Text("???"),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text("???"),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text("???????????????????????????"),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: TextField(
                              maxLength: 7,
                              keyboardType: TextInputType.text,
                              controller: addressController1,
                              decoration: InputDecoration(
                                hintText: "???",
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 155),
                          SizedBox(
                            width: 410,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: addressController2,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 155),
                          SizedBox(
                            width: 410,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: addressController3,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 155),
                          SizedBox(
                            width: 410,
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: const [
                          Text(
                            "????????????????????????????????????",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "???400?????????????????????????????????????????????????????????????????????????????????????????????",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            width: 700,
                            height: 200,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: commentController,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \n ?????????????????????????????????????????????????????????????????????????????????",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "??????????????????????????????",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 100),
            Row(
              children: [
                const Text("??????????????????????????????"),
                const SizedBox(width: 10),
                CheckBoxCustom(paymentIsVerifedFn),
                const SizedBox(width: 10),
                const Text("???????????????"),
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
                "??????????????????",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 100),
            Row(
              children: [
                const Text("??????????????????????????????"),
                const SizedBox(width: 10),
                CheckBoxCustom(serviceIsVerifedFn),
                const SizedBox(width: 10),
                const Text("???????????????"),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "??????????????????????????????????????????????????????????????????????????????????????????????????????",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "???????????????E-mail??????????????????????????????????????????",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (isErrorText)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "??????????????????????????????????????????????????????????????????????????????\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n???????????????????????????????????????????????????",
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
                '?????????????????????',
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
                '???????????????????????????????????????',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(20),
          width: 500,
          color: Colors.amber[300],
          child: const Text(
            "??????????????????????????????????????????????????????\n??? ?????????????????????????????????????????????????????????????????????",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
