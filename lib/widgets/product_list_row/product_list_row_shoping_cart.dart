import 'package:flutter/material.dart';

import '../../_routers.dart';
import '../../data/param_data.dart';
import '../../models/shoping_cart_item.dart';

class ListRowShopingCart extends StatelessWidget {
  final ShopingCartItemModel shopingCartProductItem;

  const ListRowShopingCart(this.shopingCartProductItem, {super.key});

  getParam(paramId) {
    var par = paramData.where((element) => element.paramId == paramId);
    return par.isNotEmpty ? par.first.paranName : "noParam";
  }

  @override
  Widget build(BuildContext context) {
    double totolPrice =
        shopingCartProductItem.product.total * shopingCartProductItem.quantity;

    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.productDetailPage,
            arguments: shopingCartProductItem.product.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  height: 180,
                  child: Image.network(
                    shopingCartProductItem.product.imageUrl,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      shopingCartProductItem.product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(shopingCartProductItem.product.description),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text("1箱16袋入り"),
                              Text(getParam(
                                  shopingCartProductItem.product.paramId)),
                            ],
                          ),
                          const SizedBox(width: 20),
                          const CircleAvatar(
                            minRadius: 15,
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.recycling,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const CircleAvatar(
                            minRadius: 15,
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.language_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const CircleAvatar(
                            minRadius: 15,
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.compost,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("数量: ${shopingCartProductItem.quantity}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "¥${totolPrice}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
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
