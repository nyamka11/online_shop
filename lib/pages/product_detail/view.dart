import 'package:flutter/material.dart';
import 'package:online_shop/models/shoping_cart.dart';
import 'package:online_shop/pages/product_detail/picture_layout.dart';
import 'package:online_shop/widgets/right_window/view.dart';
import 'package:provider/provider.dart';
import '../../_routers.dart';
import '../../models/product.dart';
import '../../provider/shoping_cart_provider.dart';
import '../../widgets/_common/layout_template.dart';
import 'basic_info.dart';

class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed('/');
      });
      return Container();
    }

    final shopingCardProvider = Provider.of<ShopingCartProvider>(context);
    final productItem =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    final shopingCartItem = ShopingCartModel(
      quantity: 1,
      product: productItem,
    );

    return MainLayoutTemplate(
      body: SizedBox(
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
                width: constraints.maxWidth * 0.75,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                PictureLayout(
                                  productItem: productItem,
                                  constWidth: constraints.maxWidth,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                BasicInfo(
                                  shopingCartItem: shopingCartItem,
                                  constWidth: constraints.maxWidth,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          width: 300,
                          height: 35,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: const Text('このままお買い物をつづけますか。'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          shopingCardProvider.addItem(
                                            shopingCartItem,
                                          );
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushNamed(
                                            Routes.productListPage,
                                          );
                                        },
                                        child: const Text('買い物を続ける'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Close the dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('注文に進む'),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.add_shopping_cart_outlined),
                            label: const Text('カートに入れる'),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 35,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.shopping_cart_checkout_outlined),
                            label: const Text('カートに入れて注文に進む'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 2),
                          height: 100,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                          child: Text(productItem.description),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 2),
                          height: 150,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 2),
                          height: 200,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 2),
                          color: const Color.fromARGB(255, 192, 198, 247),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("地産地消"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("アップサイクル商品"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("オーガニック"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("ビーガン商品"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("寄付金"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.recycling),
                                    SizedBox(width: 5),
                                    Text("フェアトレード"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: constraints.maxWidth * 0.25,
                child: const RightWindow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
