import 'package:flutter/material.dart';
import 'package:online_shop/widgets/right_window/view.dart';
import '../../models/product.dart';
import '../../widgets/_common/layout_template.dart';
import '../../_constants.dart';

class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed('/');
      });
      return Container(); //BUILD SOMETHING
    }

    final productItem =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigPicFrame(
                          productItem: productItem,
                          constWidth: constraints.maxWidth,
                        ),
                        BasicInfo(productItem: productItem),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SmallPicsFrame(productItem: productItem),
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
                              //タップ時の処理
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
                          margin: EdgeInsets.only(top: 20),
                          height: 100,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                          child: Text(productItem.description),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          height: 150,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                          child: Text("TEXT"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          height: 200,
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: double.infinity,
                          child: Text("TEXT"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          height: 200,
                          color: Color.fromARGB(255, 192, 198, 247),
                          width: double.infinity,
                          child: Text("TEXT"),
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
              // Image.network(productItem.imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallPicsFrame extends StatelessWidget {
  const SmallPicsFrame({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            print("asdfa");
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 146, 146, 146),
              ),
            ),
            child: Image.network(productItem.imageUrl),
          ),
        ),
        InkWell(
          onTap: () {
            print("asdfa");
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 146, 146, 146),
              ),
            ),
            child: Image.network(productItem.imageUrl),
          ),
        ),
        InkWell(
          onTap: () {
            print("asdfa");
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 146, 146, 146),
              ),
            ),
            child: Image.network(productItem.imageUrl),
          ),
        ),
      ],
    );
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            productItem.title,
            style: const TextStyle(
              fontFamily: "OpenSans",
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          const Text("新着/お勧め"),
          const SizedBox(height: 20),
          Text(
            "単価 ${productItem.price}¥",
            style: const TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "税率 99%",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 16,
                color: Color.fromARGB(255, 255, 72, 0)),
          ),
          const SizedBox(height: 10),
          const Text(
            "数量: ",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "金額 999,999¥",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 17,
            ),
          ),
          const Text(
            "単価 999,999,999¥",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 17,
            ),
          ),
          const Text(
            "会計 999,999,999¥",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 100),
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BigPicFrame extends StatelessWidget {
  const BigPicFrame({
    Key? key,
    required this.productItem,
    required this.constWidth,
  }) : super(key: key);

  final ProductModel productItem;
  final double constWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(
        right: 10,
        top: 10,
        left: 10,
      ),
      width: constWidth * 0.7 / 2,
      height: constWidth * 0.7 / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 146, 146, 146),
        ),
      ),
      child: Image.network(productItem.imageUrl),
    );
  }
}
