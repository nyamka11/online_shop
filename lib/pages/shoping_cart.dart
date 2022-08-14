import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/shoping_cart_data.dart';
import '../widgets/_common/layout_template.dart';
import '../_routers.dart';
import '../provider/shoping_cart_provider.dart';

class ShopingCartPage extends StatelessWidget {
  const ShopingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shopingCard = Provider.of<ShopingCart>(context);

    return MainLayoutTemplate(
      body: LayoutBuilder(builder: (context, constraints) {
        return shopingCard.count == 0
            ? SizedBox(
                height: 200,
                child: Column(
                  children: const [
                    Text("Empty cart"),
                    Icon(
                      Icons.shopping_cart,
                    )
                  ],
                ),
              )
            : Column(
                // crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
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
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Container(color: Colors.amber),
                              ),
                              Flexible(
                                flex: 5,
                                child: Container(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}

class ListRows extends StatelessWidget {
  final int index;
  final BuildContext ctx;
  const ListRows({super.key, required this.index, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.productDetailPage);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  height: 120,
                  // color: Colors.grey,
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Image.network(
                    shopingCartList[index].imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        shopingCartList[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: 40,
                      child: Text(shopingCartList[index].description),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "¥${shopingCartList[index].price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      // padding: EdgeInsets.all(8),
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("923"),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.comment_outlined,
                            color: Color.fromARGB(255, 42, 42, 41),
                            size: 18.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("230"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
